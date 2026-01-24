import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class ResultsPreviewWidget extends StatefulWidget {
  final int transactionCount;
  final double confidenceScore;
  final String estimatedValue;
  final bool isVisible;
  final VoidCallback onReviewTap;

  const ResultsPreviewWidget({
    super.key,
    required this.transactionCount,
    required this.confidenceScore,
    required this.estimatedValue,
    required this.isVisible,
    required this.onReviewTap,
  });

  @override
  State<ResultsPreviewWidget> createState() => _ResultsPreviewWidgetState();
}

class _ResultsPreviewWidgetState extends State<ResultsPreviewWidget>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _celebrationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _celebrationAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _celebrationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _celebrationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _celebrationController,
      curve: Curves.bounceOut,
    ));

    if (widget.isVisible) {
      _slideController.forward();
      Future.delayed(Duration(milliseconds: 300), () {
        _celebrationController.forward();
      });
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _celebrationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ResultsPreviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        _slideController.forward();
        Future.delayed(Duration(milliseconds: 300), () {
          _celebrationController.forward();
        });
      } else {
        _slideController.reverse();
        _celebrationController.reset();
      }
    }
  }

  Color _getConfidenceColor() {
    if (widget.confidenceScore >= 0.8) {
      return AppTheme.getSuccessColor(true);
    } else if (widget.confidenceScore >= 0.6) {
      return AppTheme.getWarningColor(true);
    } else {
      return AppTheme.getErrorColor(true);
    }
  }

  String _getConfidenceText() {
    if (widget.confidenceScore >= 0.8) {
      return 'High Confidence';
    } else if (widget.confidenceScore >= 0.6) {
      return 'Medium Confidence';
    } else {
      return 'Low Confidence';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        width: 90.w,
        margin: EdgeInsets.only(bottom: 2.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.getSuccessColor(true).withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with celebration animation
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppTheme.getSuccessColor(true).withValues(alpha: 0.05),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                children: [
                  AnimatedBuilder(
                    animation: _celebrationAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _celebrationAnimation.value,
                        child: Container(
                          width: 12.w,
                          height: 12.w,
                          decoration: BoxDecoration(
                            color: AppTheme.getSuccessColor(true)
                                .withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomIconWidget(
                              iconName: 'celebration',
                              color: AppTheme.getSuccessColor(true),
                              size: 6.w,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Processing Complete!',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          'Found ${widget.transactionCount} transactions',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    icon: AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: Duration(milliseconds: 200),
                      child: CustomIconWidget(
                        iconName: 'expand_more',
                        color: colorScheme.onSurfaceVariant,
                        size: 6.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Expandable content
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _isExpanded ? null : 0,
              child: _isExpanded
                  ? Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        children: [
                          // Statistics cards
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  context,
                                  'Transactions',
                                  widget.transactionCount.toString(),
                                  Icons.receipt_long,
                                  AppTheme.lightTheme.colorScheme.primary,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: _buildStatCard(
                                  context,
                                  'Est. Value',
                                  widget.estimatedValue,
                                  Icons.account_balance_wallet,
                                  AppTheme.lightTheme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.w),

                          // Confidence score
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                              color:
                                  _getConfidenceColor().withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _getConfidenceColor()
                                    .withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                CustomIconWidget(
                                  iconName: 'verified',
                                  color: _getConfidenceColor(),
                                  size: 5.w,
                                ),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _getConfidenceText(),
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                          color: _getConfidenceColor(),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '${(widget.confidenceScore * 100).toInt()}% accuracy',
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${(widget.confidenceScore * 100).toInt()}%',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: _getConfidenceColor(),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),

            // Action button
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(4.w),
              child: ElevatedButton(
                onPressed: widget.onReviewTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.lightTheme.colorScheme.primary,
                  foregroundColor: AppTheme.lightTheme.colorScheme.onPrimary,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconWidget(
                      iconName: 'rate_review',
                      color: AppTheme.lightTheme.colorScheme.onPrimary,
                      size: 5.w,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      'Review & Approve',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppTheme.lightTheme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          CustomIconWidget(
            iconName: icon.codePoint.toString(),
            color: color,
            size: 6.w,
          ),
          SizedBox(height: 1.h),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
