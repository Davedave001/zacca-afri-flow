import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';
import './transaction_list_item.dart';

class GroupedTransactionList extends StatefulWidget {
  final List<Map<String, dynamic>> transactions;
  final Function(Map<String, dynamic>) onTransactionTap;
  final Function(Map<String, dynamic>) onTransactionLongPress;

  const GroupedTransactionList({
    super.key,
    required this.transactions,
    required this.onTransactionTap,
    required this.onTransactionLongPress,
  });

  @override
  State<GroupedTransactionList> createState() => _GroupedTransactionListState();
}

class _GroupedTransactionListState extends State<GroupedTransactionList> {
  final Set<String> _expandedMonths = {};

  Map<String, List<Map<String, dynamic>>> get _groupedTransactions {
    final Map<String, List<Map<String, dynamic>>> grouped = {};

    for (final transaction in widget.transactions) {
      final String monthKey = transaction["monthKey"] ?? "Unknown";
      if (!grouped.containsKey(monthKey)) {
        grouped[monthKey] = [];
      }
      grouped[monthKey]!.add(transaction);
    }

    return grouped;
  }

  @override
  void initState() {
    super.initState();
    // Expand current month by default
    final currentMonth = _getCurrentMonthKey();
    _expandedMonths.add(currentMonth);
  }

  String _getCurrentMonthKey() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final groupedData = _groupedTransactions;

    if (groupedData.isEmpty) {
      return _buildEmptyState(theme, colorScheme);
    }

    return ListView.builder(
      padding: EdgeInsets.only(top: 2.h, bottom: 10.h),
      itemCount: groupedData.length,
      itemBuilder: (context, index) {
        final monthKey = groupedData.keys.elementAt(index);
        final transactions = groupedData[monthKey]!;
        final isExpanded = _expandedMonths.contains(monthKey);

        return _buildMonthSection(
          theme,
          colorScheme,
          monthKey,
          transactions,
          isExpanded,
        );
      },
    );
  }

  Widget _buildEmptyState(ThemeData theme, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: CustomIconWidget(
                iconName: 'folder_open',
                color: colorScheme.primary,
                size: 40,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              'No Records Found',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              'Import your first WhatsApp chat or add transactions to get started with your SDR Vault.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 4.h),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/whats-app-import-screen');
              },
              icon: CustomIconWidget(
                iconName: 'add',
                color: colorScheme.onPrimary,
                size: 20,
              ),
              label: Text('Import First Chat'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSection(
    ThemeData theme,
    ColorScheme colorScheme,
    String monthKey,
    List<Map<String, dynamic>> transactions,
    bool isExpanded,
  ) {
    final monthTotal = transactions.fold<double>(
      0.0,
      (sum, transaction) {
        final amount = (transaction["amount"] as num?)?.toDouble() ?? 0.0;
        final type = transaction["type"] ?? "expense";
        return sum + (type.toLowerCase() == "income" ? amount : -amount);
      },
    );

    return Column(
      children: [
        // Month Header
        GestureDetector(
          onTap: () {
            setState(() {
              if (isExpanded) {
                _expandedMonths.remove(monthKey);
              } else {
                _expandedMonths.add(monthKey);
              }
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIconWidget(
                      iconName: isExpanded ? 'expand_less' : 'expand_more',
                      color: colorScheme.primary,
                      size: 24,
                    ),
                    SizedBox(width: 3.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _formatMonthKey(monthKey),
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '${transactions.length} transactions',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${monthTotal >= 0 ? '+' : ''}KES ${monthTotal.abs().toStringAsFixed(0)}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: monthTotal >= 0
                            ? colorScheme.tertiary
                            : colorScheme.error,
                      ),
                    ),
                    Text(
                      'Net Total',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Transactions List
        if (isExpanded) ...[
          ...transactions.map((transaction) {
            return TransactionListItem(
              transaction: transaction,
              onTap: () => widget.onTransactionTap(transaction),
              onLongPress: () => widget.onTransactionLongPress(transaction),
            );
          }).toList(),
        ],
      ],
    );
  }

  String _formatMonthKey(String monthKey) {
    try {
      final parts = monthKey.split('-');
      if (parts.length == 2) {
        final year = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final monthNames = [
          'January',
          'February',
          'March',
          'April',
          'May',
          'June',
          'July',
          'August',
          'September',
          'October',
          'November',
          'December'
        ];
        return '${monthNames[month - 1]} $year';
      }
    } catch (e) {
      // Fallback to original key if parsing fails
    }
    return monthKey;
  }
}
