import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class InstructionStepsWidget extends StatelessWidget {
  const InstructionStepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final List<Map<String, dynamic>> steps = [
      {
        'number': '1',
        'title': 'Export WhatsApp Chat',
        'description':
            'Open WhatsApp → Chat → More → Export Chat → Without Media',
        'icon': 'chat',
      },
      {
        'number': '2',
        'title': 'Select .txt File',
        'description': 'Choose the exported chat file from your device storage',
        'icon': 'folder_open',
      },
      {
        'number': '3',
        'title': 'AI Processing',
        'description': 'Our AI will analyze and extract business transactions',
        'icon': 'psychology',
      },
    ];

    return Container(
      width: 90.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomIconWidget(
                iconName: 'info',
                color: AppTheme.lightTheme.colorScheme.primary,
                size: 5.w,
              ),
              SizedBox(width: 3.w),
              Text(
                'How to Import',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            final isLast = index == steps.length - 1;

            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: AppTheme.lightTheme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              step['number'],
                              style: theme.textTheme.labelMedium?.copyWith(
                                color:
                                    AppTheme.lightTheme.colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: 4.h,
                            color: colorScheme.outline.withValues(alpha: 0.3),
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                          ),
                      ],
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomIconWidget(
                                iconName: step['icon'],
                                color: colorScheme.onSurfaceVariant,
                                size: 4.w,
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Text(
                                  step['title'],
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            step['description'],
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          if (!isLast) SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
