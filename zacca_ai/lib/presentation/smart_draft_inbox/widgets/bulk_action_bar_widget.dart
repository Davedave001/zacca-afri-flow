import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class BulkActionBarWidget extends StatelessWidget {
  final int selectedCount;
  final VoidCallback? onApproveAll;
  final VoidCallback? onRejectAll;
  final VoidCallback? onDeleteAll;
  final VoidCallback? onCancel;

  const BulkActionBarWidget({
    super.key,
    required this.selectedCount,
    this.onApproveAll,
    this.onRejectAll,
    this.onDeleteAll,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: selectedCount > 0 ? 10.h : 0,
      child: selectedCount > 0
          ? Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: onCancel,
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          child: CustomIconWidget(
                            iconName: 'close',
                            color: colorScheme.onSurfaceVariant,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '$selectedCount selected',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          _buildActionButton(
                            context,
                            icon: 'check',
                            color: AppTheme.getSuccessColor(
                                theme.brightness == Brightness.light),
                            onTap: onApproveAll,
                          ),
                          SizedBox(width: 2.w),
                          _buildActionButton(
                            context,
                            icon: 'close',
                            color: AppTheme.getWarningColor(
                                theme.brightness == Brightness.light),
                            onTap: onRejectAll,
                          ),
                          SizedBox(width: 2.w),
                          _buildActionButton(
                            context,
                            icon: 'delete',
                            color: AppTheme.getErrorColor(
                                theme.brightness == Brightness.light),
                            onTap: onDeleteAll,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: CustomIconWidget(
          iconName: icon,
          color: color,
          size: 20,
        ),
      ),
    );
  }
}
