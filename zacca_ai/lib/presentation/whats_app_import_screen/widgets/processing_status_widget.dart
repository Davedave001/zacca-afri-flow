import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

enum ProcessingStage {
  analyzing,
  extracting,
  generating,
  completed,
}

class ProcessingStatusWidget extends StatefulWidget {
  final ProcessingStage currentStage;
  final double progress;
  final bool isVisible;

  const ProcessingStatusWidget({
    super.key,
    required this.currentStage,
    required this.progress,
    required this.isVisible,
  });

  @override
  State<ProcessingStatusWidget> createState() => _ProcessingStatusWidgetState();
}

class _ProcessingStatusWidgetState extends State<ProcessingStatusWidget>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    if (widget.isVisible) {
      _slideController.forward();
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ProcessingStatusWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        _slideController.forward();
        _pulseController.repeat(reverse: true);
      } else {
        _slideController.reverse();
        _pulseController.stop();
      }
    }
  }

  String _getStageText() {
    switch (widget.currentStage) {
      case ProcessingStage.analyzing:
        return 'Analyzing conversations...';
      case ProcessingStage.extracting:
        return 'Extracting transactions...';
      case ProcessingStage.generating:
        return 'Generating summaries...';
      case ProcessingStage.completed:
        return 'Processing completed!';
    }
  }

  IconData _getStageIcon() {
    switch (widget.currentStage) {
      case ProcessingStage.analyzing:
        return Icons.psychology;
      case ProcessingStage.extracting:
        return Icons.data_exploration;
      case ProcessingStage.generating:
        return Icons.summarize;
      case ProcessingStage.completed:
        return Icons.check_circle;
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
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                AppTheme.lightTheme.colorScheme.primary.withValues(alpha: 0.2),
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
            Row(
              children: [
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: widget.currentStage == ProcessingStage.completed
                          ? 1.0
                          : _pulseAnimation.value,
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          color:
                              widget.currentStage == ProcessingStage.completed
                                  ? AppTheme.getSuccessColor(true)
                                      .withValues(alpha: 0.1)
                                  : AppTheme.lightTheme.colorScheme.primary
                                      .withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomIconWidget(
                            iconName: _getStageIcon().codePoint.toString(),
                            color:
                                widget.currentStage == ProcessingStage.completed
                                    ? AppTheme.getSuccessColor(true)
                                    : AppTheme.lightTheme.colorScheme.primary,
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
                        'AI Processing',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        _getStageText(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${(widget.progress * 100).toInt()}%',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: AppTheme.lightTheme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: widget.progress,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.currentStage == ProcessingStage.completed
                          ? AppTheme.getSuccessColor(true)
                          : AppTheme.lightTheme.colorScheme.primary,
                    ),
                    minHeight: 1.h,
                  ),
                ),
              ],
            ),
            if (widget.currentStage == ProcessingStage.completed) ...[
              SizedBox(height: 3.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: AppTheme.getSuccessColor(true).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        AppTheme.getSuccessColor(true).withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    CustomIconWidget(
                      iconName: 'check_circle',
                      color: AppTheme.getSuccessColor(true),
                      size: 5.w,
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Text(
                        'Successfully processed chat data. Ready for review!',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppTheme.getSuccessColor(true),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
