import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class ApplicationTrackingSection extends StatelessWidget {
  final List<Map<String, dynamic>> applications;

  const ApplicationTrackingSection({
    super.key,
    required this.applications,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (applications.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomIconWidget(
                iconName: 'track_changes',
                color: colorScheme.onSurface,
                size: 24,
              ),
              SizedBox(width: 2.w),
              Text(
                'Application Tracking',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          ...applications
              .map((application) => _buildApplicationCard(
                    context,
                    application,
                    colorScheme,
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildApplicationCard(
    BuildContext context,
    Map<String, dynamic> application,
    ColorScheme colorScheme,
  ) {
    final theme = Theme.of(context);
    final status = application['status'] as String;
    final statusColor = _getStatusColor(status);

    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CustomImageWidget(
                    imageUrl: application['bankLogo'] as String,
                    width: 10.w,
                    height: 10.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      application['bankName'] as String,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      'KES ${(application['amount'] as num).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _getStatusText(status),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          _buildProgressIndicator(status, colorScheme),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Applied On',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      application['appliedDate'] as String,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Step',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      application['nextStep'] as String,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(String status, ColorScheme colorScheme) {
    final steps = ['submitted', 'review', 'verification', 'approved'];
    final currentStepIndex = steps.indexOf(status.toLowerCase());

    return Row(
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final isCompleted = index <= currentStepIndex;

        return Expanded(
          child: Row(
            children: [
              Container(
                width: 3.w,
                height: 3.w,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppTheme.lightTheme.primaryColor
                      : colorScheme.outline.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: isCompleted
                    ? CustomIconWidget(
                        iconName: 'check',
                        color: Colors.white,
                        size: 12,
                      )
                    : null,
              ),
              if (index < steps.length - 1)
                Expanded(
                  child: Container(
                    height: 2,
                    color: isCompleted
                        ? AppTheme.lightTheme.primaryColor
                        : colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return AppTheme.getSuccessColor(true);
      case 'rejected':
        return AppTheme.getErrorColor(true);
      case 'pending':
      case 'review':
      case 'verification':
        return AppTheme.getWarningColor(true);
      default:
        return AppTheme.lightTheme.primaryColor;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'submitted':
        return 'Submitted';
      case 'review':
        return 'Under Review';
      case 'verification':
        return 'Verification';
      case 'approved':
        return 'Approved';
      case 'rejected':
        return 'Rejected';
      default:
        return 'Pending';
    }
  }
}
