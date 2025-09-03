import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class MetricCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final String iconName;
  final Color? iconColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const MetricCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconName,
    this.iconColor,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: 42.w,
        padding: EdgeInsets.all(4.w),
        margin: EdgeInsets.only(right: 3.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color:
                        AppTheme.lightTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomIconWidget(
                    iconName: iconName,
                    color: iconColor ?? AppTheme.lightTheme.primaryColor,
                    size: 20,
                  ),
                ),
                CustomIconWidget(
                  iconName: 'more_vert',
                  color: colorScheme.onSurfaceVariant,
                  size: 16,
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppTheme.lightTheme.primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              subtitle,
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
