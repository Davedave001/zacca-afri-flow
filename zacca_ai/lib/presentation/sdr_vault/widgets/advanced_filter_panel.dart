import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class AdvancedFilterPanel extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const AdvancedFilterPanel({
    super.key,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  State<AdvancedFilterPanel> createState() => _AdvancedFilterPanelState();
}

class _AdvancedFilterPanelState extends State<AdvancedFilterPanel> {
  DateTimeRange? _selectedDateRange;
  RangeValues _amountRange = RangeValues(0, 100000);
  Set<String> _selectedTypes = {};
  String? _selectedContact;

  final List<String> _transactionTypes = [
    'Income',
    'Expense',
    'Transfer',
    'Investment',
    'Loan',
  ];

  final List<String> _contacts = [
    'John Mwangi',
    'Sarah Wanjiku',
    'Peter Kamau',
    'Grace Akinyi',
    'David Ochieng',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: widget.isExpanded ? 35.h : 8.h,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
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
        child: Column(
          children: [
            // Header
            GestureDetector(
              onTap: widget.onToggle,
              child: Container(
                padding: EdgeInsets.all(4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomIconWidget(
                          iconName: 'filter_list',
                          color: colorScheme.primary,
                          size: 20,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          'Advanced Filters',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    CustomIconWidget(
                      iconName:
                          widget.isExpanded ? 'expand_less' : 'expand_more',
                      color: colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            // Filter Content
            if (widget.isExpanded) ...[
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Range
                      _buildFilterSection(
                        'Date Range',
                        _buildDateRangeSelector(theme, colorScheme),
                      ),
                      SizedBox(height: 3.h),
                      // Amount Range
                      _buildFilterSection(
                        'Amount Range',
                        _buildAmountRangeSlider(theme, colorScheme),
                      ),
                      SizedBox(height: 3.h),
                      // Transaction Types
                      _buildFilterSection(
                        'Transaction Types',
                        _buildTransactionTypeChips(theme, colorScheme),
                      ),
                      SizedBox(height: 3.h),
                      // Contact Selection
                      _buildFilterSection(
                        'Contact',
                        _buildContactSelector(theme, colorScheme),
                      ),
                      SizedBox(height: 2.h),
                      // Action Buttons
                      _buildActionButtons(theme, colorScheme),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, Widget content) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 1.h),
        content,
      ],
    );
  }

  Widget _buildDateRangeSelector(ThemeData theme, ColorScheme colorScheme) {
    return GestureDetector(
      onTap: () async {
        final DateTimeRange? picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          initialDateRange: _selectedDateRange,
        );
        if (picked != null) {
          setState(() {
            _selectedDateRange = picked;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDateRange != null
                  ? '${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month}/${_selectedDateRange!.start.year} - ${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}/${_selectedDateRange!.end.year}'
                  : 'Select date range',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _selectedDateRange != null
                    ? colorScheme.onSurface
                    : colorScheme.onSurfaceVariant,
              ),
            ),
            CustomIconWidget(
              iconName: 'calendar_today',
              color: colorScheme.primary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountRangeSlider(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      children: [
        RangeSlider(
          values: _amountRange,
          min: 0,
          max: 500000,
          divisions: 100,
          labels: RangeLabels(
            'KES ${_amountRange.start.round()}',
            'KES ${_amountRange.end.round()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _amountRange = values;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'KES ${_amountRange.start.round()}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              'KES ${_amountRange.end.round()}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransactionTypeChips(ThemeData theme, ColorScheme colorScheme) {
    return Wrap(
      spacing: 2.w,
      runSpacing: 1.h,
      children: _transactionTypes.map((type) {
        final isSelected = _selectedTypes.contains(type);
        return FilterChip(
          label: Text(type),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedTypes.add(type);
              } else {
                _selectedTypes.remove(type);
              }
            });
          },
          backgroundColor: colorScheme.surface,
          selectedColor: colorScheme.primary.withValues(alpha: 0.1),
          checkmarkColor: colorScheme.primary,
          labelStyle: theme.textTheme.bodySmall?.copyWith(
            color:
                isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
          side: BorderSide(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContactSelector(ThemeData theme, ColorScheme colorScheme) {
    return DropdownButtonFormField<String>(
      value: _selectedContact,
      decoration: InputDecoration(
        hintText: 'Select contact',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      ),
      items: _contacts.map((contact) {
        return DropdownMenuItem<String>(
          value: contact,
          child: Text(
            contact,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedContact = value;
        });
      },
    );
  }

  Widget _buildActionButtons(ThemeData theme, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                _selectedDateRange = null;
                _amountRange = RangeValues(0, 100000);
                _selectedTypes.clear();
                _selectedContact = null;
              });
            },
            child: Text('Clear All'),
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Apply filters logic
              widget.onToggle();
            },
            child: Text('Apply Filters'),
          ),
        ),
      ],
    );
  }
}
