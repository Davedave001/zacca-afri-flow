import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final String? illustrationUrl;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onButtonPressed,
    this.illustrationUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration
            Container(
              width: 60.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20),
              ),
              child: illustrationUrl != null
                  ? CustomImageWidget(
                      imageUrl: illustrationUrl!,
                      width: 60.w,
                      height: 30.h,
                      fit: BoxFit.contain,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: CustomIconWidget(
                            iconName: 'inbox',
                            color: colorScheme.primary,
                            size: 8.w,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          width: 40.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(0.5.h),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          width: 30.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: colorScheme.outline.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(0.5.h),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 4.h),

            // Title
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),

            // Subtitle
            Text(
              subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),

            // Action Button
            if (onButtonPressed != null)
              SizedBox(
                width: 70.w,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconWidget(
                        iconName: 'add',
                        color: colorScheme.onPrimary,
                        size: 20,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        buttonText,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onPrimary,
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
}
