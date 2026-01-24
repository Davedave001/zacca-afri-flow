import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class QuickActionWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  const QuickActionWidget({
    super.key,
    required this.title,
    required this.iconName,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.06),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: (iconColor ?? AppTheme.lightTheme.primaryColor)
                    .withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomIconWidget(
                iconName: iconName,
                color: iconColor ?? AppTheme.lightTheme.primaryColor,
                size: 24,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
