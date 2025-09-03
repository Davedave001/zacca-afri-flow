import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class FilterChips extends StatelessWidget {
  final List<String> selectedFilters;
  final ValueChanged<List<String>> onFiltersChanged;

  const FilterChips({
    super.key,
    required this.selectedFilters,
    required this.onFiltersChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final List<Map<String, dynamic>> filterOptions = [
      {'label': 'Working Capital', 'value': 'working_capital'},
      {'label': 'Equipment', 'value': 'equipment'},
      {'label': 'Expansion', 'value': 'expansion'},
      {'label': 'Emergency', 'value': 'emergency'},
      {'label': 'Low Interest', 'value': 'low_interest'},
      {'label': 'Quick Approval', 'value': 'quick_approval'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomIconWidget(
                iconName: 'filter_list',
                color: colorScheme.onSurfaceVariant,
                size: 20,
              ),
              SizedBox(width: 2.w),
              Text(
                'Filter Offers',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              if (selectedFilters.isNotEmpty)
                GestureDetector(
                  onTap: () => onFiltersChanged([]),
                  child: Text(
                    'Clear All',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppTheme.lightTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 1.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filterOptions.map((filter) {
                final isSelected = selectedFilters.contains(filter['value']);
                return Container(
                  margin: EdgeInsets.only(right: 2.w),
                  child: FilterChip(
                    label: Text(
                      filter['label'] as String,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isSelected
                            ? Colors.white
                            : colorScheme.onSurfaceVariant,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      List<String> newFilters = List.from(selectedFilters);
                      if (selected) {
                        newFilters.add(filter['value'] as String);
                      } else {
                        newFilters.remove(filter['value']);
                      }
                      onFiltersChanged(newFilters);
                    },
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    selectedColor: AppTheme.lightTheme.primaryColor,
                    checkmarkColor: Colors.white,
                    side: BorderSide(
                      color: isSelected
                          ? AppTheme.lightTheme.primaryColor
                          : colorScheme.outline.withValues(alpha: 0.3),
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
