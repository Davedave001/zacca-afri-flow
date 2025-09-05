import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class TransactionCardWidget extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final VoidCallback? onTap;
  final VoidCallback? onApprove;
  final VoidCallback? onEdit;
  final VoidCallback? onReject;
  final VoidCallback? onDelete;
  final bool isSelected;
  final VoidCallback? onLongPress;

  const TransactionCardWidget({
    super.key,
    required this.transaction,
    this.onTap,
    this.onApprove,
    this.onEdit,
    this.onReject,
    this.onDelete,
    this.isSelected = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final confidenceScore = (transaction['confidenceScore'] as double?) ?? 0.0;
    final amount = transaction['amount'] as String? ?? '0';
    final contact = transaction['contact'] as String? ?? 'Unknown';
    final summary = transaction['summary'] as String? ?? '';
    final timestamp = transaction['timestamp'] as DateTime? ?? DateTime.now();
    final status = transaction['status'] as String? ?? 'pending';

    return Slidable(
      key: ValueKey(transaction['id']),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              HapticFeedback.lightImpact();
              onApprove?.call();
            },
            backgroundColor:
                AppTheme.getSuccessColor(theme.brightness == Brightness.light),
            foregroundColor: Colors.white,
            icon: Icons.check,
            label: 'Approve',
            borderRadius: BorderRadius.circular(12),
          ),
          SlidableAction(
            onPressed: (_) {
              HapticFeedback.lightImpact();
              onEdit?.call();
            },
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
            borderRadius: BorderRadius.circular(12),
          ),
          SlidableAction(
            onPressed: (_) {
              HapticFeedback.lightImpact();
              onReject?.call();
            },
            backgroundColor:
                AppTheme.getWarningColor(theme.brightness == Brightness.light),
            foregroundColor: Colors.white,
            icon: Icons.close,
            label: 'Reject',
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              HapticFeedback.mediumImpact();
              onDelete?.call();
            },
            backgroundColor:
                AppTheme.getErrorColor(theme.brightness == Brightness.light),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: () {
          HapticFeedback.mediumImpact();
          onLongPress?.call();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.1)
                : colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.2),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            _formatTimestamp(timestamp),
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
                          'KES $amount',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        _buildConfidenceChip(context, confidenceScore),
                      ],
                    ),
                  ],
                ),
                if (summary.isNotEmpty) ...[
                  SizedBox(height: 2.h),
                  Text(
                    summary,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                SizedBox(height: 2.h),
                Row(
                  children: [
                    _buildStatusChip(context, status),
                    Spacer(),
                    if (isSelected)
                      Container(
                        padding: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: CustomIconWidget(
                          iconName: 'check',
                          color: colorScheme.onPrimary,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfidenceChip(BuildContext context, double score) {
    final theme = Theme.of(context);

    Color chipColor;
    String label;

    if (score >= 0.9) {
      chipColor =
          AppTheme.getSuccessColor(theme.brightness == Brightness.light);
      label = 'High';
    } else if (score >= 0.7) {
      chipColor =
          AppTheme.getWarningColor(theme.brightness == Brightness.light);
      label = 'Medium';
    } else {
      chipColor = AppTheme.getErrorColor(theme.brightness == Brightness.light);
      label = 'Low';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: chipColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        '$label ${(score * 100).toInt()}%',
        style: theme.textTheme.labelSmall?.copyWith(
          color: chipColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    final theme = Theme.of(context);

    Color chipColor;
    String label;
    IconData icon;

    switch (status.toLowerCase()) {
      case 'approved':
        chipColor =
            AppTheme.getSuccessColor(theme.brightness == Brightness.light);
        label = 'Approved';
        icon = Icons.check_circle;
        break;
      case 'rejected':
        chipColor =
            AppTheme.getErrorColor(theme.brightness == Brightness.light);
        label = 'Rejected';
        icon = Icons.cancel;
        break;
      case 'pending':
      default:
        chipColor = colorScheme.primary;
        label = 'Pending Review';
        icon = Icons.schedule;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: chipColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIconWidget(
            iconName: icon == Icons.check_circle
                ? 'check_circle'
                : icon == Icons.cancel
                    ? 'cancel'
                    : 'schedule',
            color: chipColor,
            size: 14,
          ),
          SizedBox(width: 1.w),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: chipColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
