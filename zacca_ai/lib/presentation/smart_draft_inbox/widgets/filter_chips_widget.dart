import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterChipsWidget extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final Map<String, int> filterCounts;

  const FilterChipsWidget({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterChanged,
    this.filterCounts = const {},
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 6.h,
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        itemCount: filters.length,
        separatorBuilder: (context, index) => SizedBox(width: 2.w),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = filter == selectedFilter;
          final count = filterCounts[filter] ?? 0;

          return GestureDetector(
            onTap: () => onFilterChanged(filter),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.outline.withValues(alpha: 0.2),
                  width: 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    filter,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                  if (count > 0) ...[
                    SizedBox(width: 1.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.5.w, vertical: 0.2.h),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? colorScheme.onPrimary.withValues(alpha: 0.2)
                            : colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        count.toString(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: isSelected
                              ? colorScheme.onPrimary
                              : colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
