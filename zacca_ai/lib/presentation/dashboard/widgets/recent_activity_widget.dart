import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class RecentActivityWidget extends StatelessWidget {
  final List<Map<String, dynamic>> activities;
  final Function(int)? onArchive;

  const RecentActivityWidget({
    super.key,
    required this.activities,
    this.onArchive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activity',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/smart-draft-inbox'),
                child: Text(
                  'View All',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppTheme.lightTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          activities.isEmpty
              ? _buildEmptyState(context, theme, colorScheme)
              : ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: activities.length > 3 ? 3 : activities.length,
                  separatorBuilder: (context, index) => SizedBox(height: 1.h),
                  itemBuilder: (context, index) {
                    final activity = activities[index];
                    return Dismissible(
                      key: Key('activity_${activity['id']}'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 4.w),
                        decoration: BoxDecoration(
                          color: AppTheme.getSuccessColor(true),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CustomIconWidget(
                          iconName: 'archive',
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      onDismissed: (direction) {
                        if (onArchive != null) {
                          onArchive!(index);
                        }
                      },
                      child: _buildActivityItem(
                          context, theme, colorScheme, activity),
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    Map<String, dynamic> activity,
  ) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: _getActivityColor(activity['type'] as String)
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomIconWidget(
              iconName: _getActivityIcon(activity['type'] as String),
              color: _getActivityColor(activity['type'] as String),
              size: 18,
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['title'] as String,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  activity['description'] as String,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                activity['amount'] as String,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                activity['time'] as String,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(
      BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          CustomIconWidget(
            iconName: 'inbox',
            color: colorScheme.onSurfaceVariant,
            size: 48,
          ),
          SizedBox(height: 2.h),
          Text(
            'No recent activity',
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Import your first WhatsApp chat to get started',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 2.h),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/whats-app-import-screen'),
            child: Text('Import Chat'),
          ),
        ],
      ),
    );
  }

  Color _getActivityColor(String type) {
    switch (type) {
      case 'payment':
        return AppTheme.getSuccessColor(true);
      case 'invoice':
        return AppTheme.lightTheme.primaryColor;
      case 'expense':
        return AppTheme.getErrorColor(true);
      case 'loan':
        return AppTheme.getWarningColor(true);
      default:
        return AppTheme.lightTheme.colorScheme.secondary;
    }
  }

  String _getActivityIcon(String type) {
    switch (type) {
      case 'payment':
        return 'payment';
      case 'invoice':
        return 'receipt';
      case 'expense':
        return 'shopping_cart';
      case 'loan':
        return 'account_balance';
      default:
        return 'description';
    }
  }
}
