import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class TransactionListItem extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const TransactionListItem({
    super.key,
    required this.transaction,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final String type = transaction["type"] ?? "expense";
    final double amount = (transaction["amount"] as num?)?.toDouble() ?? 0.0;
    final bool isIncome = type.toLowerCase() == "income";
    final bool isVerified = transaction["isVerified"] ?? false;

    return Dismissible(
      key: Key(transaction["id"].toString()),
      background: _buildSwipeBackground(colorScheme, true),
      secondaryBackground: _buildSwipeBackground(colorScheme, false),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          // Archive action
          _showSnackBar(context, 'Transaction archived');
        } else {
          // Categorize action
          _showSnackBar(context, 'Transaction categorized');
        }
      },
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Transaction Icon
              Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: isIncome
                      ? colorScheme.tertiary.withValues(alpha: 0.1)
                      : colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomIconWidget(
                  iconName: _getTransactionIcon(type),
                  color: isIncome ? colorScheme.tertiary : colorScheme.error,
                  size: 20,
                ),
              ),
              SizedBox(width: 3.w),
              // Transaction Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            transaction["description"] ?? "Transaction",
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${isIncome ? '+' : '-'}KES ${amount.toStringAsFixed(0)}',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isIncome
                                ? colorScheme.tertiary
                                : colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction["date"] ?? "Today",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Row(
                          children: [
                            if (isVerified) ...[
                              CustomIconWidget(
                                iconName: 'verified',
                                color: colorScheme.tertiary,
                                size: 14,
                              ),
                              SizedBox(width: 1.w),
                            ],
                            CustomIconWidget(
                              iconName: 'link',
                              color: colorScheme.primary,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (transaction["contact"] != null) ...[
                      SizedBox(height: 0.5.h),
                      Text(
                        'From: ${transaction["contact"]}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwipeBackground(ColorScheme colorScheme, bool isLeftSwipe) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: isLeftSwipe ? colorScheme.tertiary : colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: isLeftSwipe ? Alignment.centerLeft : Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconWidget(
            iconName: isLeftSwipe ? 'archive' : 'label',
            color: Colors.white,
            size: 24,
          ),
          SizedBox(height: 0.5.h),
          Text(
            isLeftSwipe ? 'Archive' : 'Categorize',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }

  String _getTransactionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'income':
        return 'trending_up';
      case 'expense':
        return 'trending_down';
      case 'transfer':
        return 'swap_horiz';
      case 'investment':
        return 'account_balance';
      case 'loan':
        return 'credit_card';
      default:
        return 'receipt';
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
