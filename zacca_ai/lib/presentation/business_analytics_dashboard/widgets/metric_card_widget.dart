import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class MetricCardWidget extends StatelessWidget {
  final String title;
  final String currentValue;
  final String previousValue;
  final String changePercentage;
  final bool isPositive;
  final IconData icon;
  final Color? backgroundColor;

  const MetricCardWidget({
    super.key,
    required this.title,
    required this.currentValue,
    required this.previousValue,
    required this.changePercentage,
    required this.isPositive,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 75.w,
      margin: EdgeInsets.only(right: 4.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
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
                  iconName: _getIconName(icon),
                  color: AppTheme.lightTheme.primaryColor,
                  size: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                decoration: BoxDecoration(
                  color: isPositive
                      ? AppTheme.getSuccessColor(
                              theme.brightness == Brightness.light)
                          .withValues(alpha: 0.1)
                      : AppTheme.getErrorColor(
                              theme.brightness == Brightness.light)
                          .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIconWidget(
                      iconName: isPositive ? 'trending_up' : 'trending_down',
                      color: isPositive
                          ? AppTheme.getSuccessColor(
                              theme.brightness == Brightness.light)
                          : AppTheme.getErrorColor(
                              theme.brightness == Brightness.light),
                      size: 12,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      changePercentage,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isPositive
                            ? AppTheme.getSuccessColor(
                                theme.brightness == Brightness.light)
                            : AppTheme.getErrorColor(
                                theme.brightness == Brightness.light),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 1.h),
          Text(
            currentValue,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 0.5.h),
          Text(
            'Previous: $previousValue',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: 10.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _getIconName(IconData icon) {
    if (icon == Icons.trending_up) return 'trending_up';
    if (icon == Icons.account_balance_wallet) return 'account_balance_wallet';
    if (icon == Icons.people) return 'people';
    if (icon == Icons.water_drop) return 'water_drop';
    return 'analytics';
  }
}
