import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class ExportOptionsSheet extends StatelessWidget {
  final VoidCallback onExportPdf;
  final VoidCallback onExportCsv;
  final VoidCallback onExportBlockchain;
  final VoidCallback onBulkExport;

  const ExportOptionsSheet({
    super.key,
    required this.onExportPdf,
    required this.onExportCsv,
    required this.onExportBlockchain,
    required this.onBulkExport,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle Bar
          Center(
            child: Container(
              width: 12.w,
              height: 0.5.h,
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          // Title
          Text(
            'Export Options',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Choose how you want to export your transaction data',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 4.h),
          // Export Options
          _buildExportOption(
            context,
            theme,
            colorScheme,
            'PDF Report',
            'Complete formatted report with charts and summaries',
            'picture_as_pdf',
            colorScheme.error,
            onExportPdf,
          ),
          _buildExportOption(
            context,
            theme,
            colorScheme,
            'CSV Data',
            'Raw transaction data for spreadsheet analysis',
            'table_chart',
            colorScheme.tertiary,
            onExportCsv,
          ),
          _buildExportOption(
            context,
            theme,
            colorScheme,
            'Blockchain Verification',
            'Cryptographic proof of transaction authenticity',
            'security',
            colorScheme.primary,
            onExportBlockchain,
          ),
          _buildExportOption(
            context,
            theme,
            colorScheme,
            'Bulk Export',
            'Export multiple transactions with advanced options',
            'cloud_download',
            colorScheme.secondary,
            onBulkExport,
          ),
          SizedBox(height: 2.h),
          // Cancel Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildExportOption(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    String title,
    String description,
    String iconName,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onTap();
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomIconWidget(
                  iconName: iconName,
                  color: iconColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
