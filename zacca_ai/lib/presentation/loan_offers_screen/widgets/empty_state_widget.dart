import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String description;
  final String actionText;
  final VoidCallback? onActionPressed;
  final String? iconName;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.description,
    required this.actionText,
    this.onActionPressed,
    this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomIconWidget(
                iconName: iconName ?? 'credit_score',
                color: colorScheme.onSurfaceVariant,
                size: 48,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Text(
            description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          _buildImprovementTips(theme, colorScheme),
          SizedBox(height: 4.h),
          if (onActionPressed != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onActionPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.lightTheme.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                ),
                child: Text(
                  actionText,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImprovementTips(ThemeData theme, ColorScheme colorScheme) {
    final tips = [
      {
        'icon': 'trending_up',
        'title': 'Increase Transaction Volume',
        'description':
            'Upload more WhatsApp business chats to show consistent sales',
      },
      {
        'icon': 'schedule',
        'title': 'Build Payment History',
        'description': 'Connect M-Pesa to demonstrate regular payment patterns',
      },
      {
        'icon': 'verified',
        'title': 'Complete KYB Verification',
        'description':
            'Upload business registration documents for better rates',
      },
    ];

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to Improve Your Qualification',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 2.h),
          ...tips
              .map((tip) => Container(
                    margin: EdgeInsets.only(bottom: 2.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: AppTheme.lightTheme.primaryColor
                                .withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomIconWidget(
                              iconName: tip['icon'] as String,
                              color: AppTheme.lightTheme.primaryColor,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tip['title'] as String,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                tip['description'] as String,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
