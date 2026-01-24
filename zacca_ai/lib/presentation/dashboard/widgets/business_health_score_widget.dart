import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class BusinessHealthScoreWidget extends StatefulWidget {
  final double score;
  final String trend;
  final VoidCallback? onTap;

  const BusinessHealthScoreWidget({
    super.key,
    required this.score,
    required this.trend,
    this.onTap,
  });

  @override
  State<BusinessHealthScoreWidget> createState() =>
      _BusinessHealthScoreWidgetState();
}

class _BusinessHealthScoreWidgetState extends State<BusinessHealthScoreWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.score / 100,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(4.w),
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              'Business Health Score',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.h),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return CircularProgressIndicator(
                        value: _progressAnimation.value,
                        strokeWidth: 8,
                        backgroundColor: AppTheme
                            .lightTheme.colorScheme.secondary
                            .withValues(alpha: 0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.lightTheme.colorScheme.secondary,
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return Text(
                          '${(_progressAnimation.value * 100).toInt()}%',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomIconWidget(
                          iconName: widget.trend == 'up'
                              ? 'trending_up'
                              : widget.trend == 'down'
                                  ? 'trending_down'
                                  : 'trending_flat',
                          color: widget.trend == 'up'
                              ? AppTheme.getSuccessColor(true)
                              : widget.trend == 'down'
                                  ? AppTheme.getErrorColor(true)
                                  : colorScheme.onSurfaceVariant,
                          size: 16,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          widget.trend == 'up'
                              ? 'Improving'
                              : widget.trend == 'down'
                                  ? 'Declining'
                                  : 'Stable',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: widget.trend == 'up'
                                ? AppTheme.getSuccessColor(true)
                                : widget.trend == 'down'
                                    ? AppTheme.getErrorColor(true)
                                    : colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              'Tap for detailed breakdown',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
