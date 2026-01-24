import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class TimelineDateSeparatorWidget extends StatelessWidget {
  final DateTime date;
  final int transactionCount;

  const TimelineDateSeparatorWidget({
    super.key,
    required this.date,
    this.transactionCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconWidget(
                  iconName: 'calendar_today',
                  color: colorScheme.primary,
                  size: 16,
                ),
                SizedBox(width: 2.w),
                Text(
                  _formatDate(date),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (transactionCount > 0) ...[
                  SizedBox(width: 2.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.3.h),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      transactionCount.toString(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              margin: EdgeInsets.only(left: 3.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.outline.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return 'Today';
    } else if (dateOnly == yesterday) {
      return 'Yesterday';
    } else if (now.difference(date).inDays < 7) {
      final weekdays = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ];
      return weekdays[date.weekday - 1];
    } else {
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      return '${date.day} ${months[date.month - 1]}';
    }
  }
}
