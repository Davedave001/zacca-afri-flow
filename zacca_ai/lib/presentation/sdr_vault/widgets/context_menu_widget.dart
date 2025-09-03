import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class ContextMenuWidget extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final VoidCallback onViewDetails;
  final VoidCallback onExportPdf;
  final VoidCallback onShare;
  final VoidCallback onArchive;
  final VoidCallback onClose;

  const ContextMenuWidget({
    super.key,
    required this.transaction,
    required this.onViewDetails,
    required this.onExportPdf,
    required this.onShare,
    required this.onArchive,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction Options',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      transaction["description"] ?? "Transaction",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onClose,
                  icon: CustomIconWidget(
                    iconName: 'close',
                    color: colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          // Menu Items
          Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              children: [
                _buildMenuItem(
                  context,
                  theme,
                  colorScheme,
                  'View Details',
                  'visibility',
                  colorScheme.primary,
                  onViewDetails,
                ),
                _buildMenuItem(
                  context,
                  theme,
                  colorScheme,
                  'Export PDF',
                  'picture_as_pdf',
                  colorScheme.error,
                  onExportPdf,
                ),
                _buildMenuItem(
                  context,
                  theme,
                  colorScheme,
                  'Share',
                  'share',
                  colorScheme.tertiary,
                  onShare,
                ),
                _buildMenuItem(
                  context,
                  theme,
                  colorScheme,
                  'Archive',
                  'archive',
                  colorScheme.onSurfaceVariant,
                  onArchive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    String title,
    String iconName,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: () {
        onClose();
        onTap();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
        child: Row(
          children: [
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomIconWidget(
                iconName: iconName,
                color: iconColor,
                size: 20,
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            CustomIconWidget(
              iconName: 'arrow_forward_ios',
              color: colorScheme.onSurfaceVariant,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
