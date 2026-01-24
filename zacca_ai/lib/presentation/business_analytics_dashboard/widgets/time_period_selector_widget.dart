import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

enum TimePeriod { sevenDays, thirtyDays, threeMonths, oneYear, custom }

class TimePeriodSelectorWidget extends StatefulWidget {
  final TimePeriod selectedPeriod;
  final ValueChanged<TimePeriod> onPeriodChanged;
  final DateTimeRange? customRange;
  final ValueChanged<DateTimeRange>? onCustomRangeChanged;

  const TimePeriodSelectorWidget({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodChanged,
    this.customRange,
    this.onCustomRangeChanged,
  });

  @override
  State<TimePeriodSelectorWidget> createState() =>
      _TimePeriodSelectorWidgetState();
}

class _TimePeriodSelectorWidgetState extends State<TimePeriodSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPeriodChip(
                    context,
                    '7D',
                    TimePeriod.sevenDays,
                    colorScheme,
                  ),
                  SizedBox(width: 2.w),
                  _buildPeriodChip(
                    context,
                    '30D',
                    TimePeriod.thirtyDays,
                    colorScheme,
                  ),
                  SizedBox(width: 2.w),
                  _buildPeriodChip(
                    context,
                    '3M',
                    TimePeriod.threeMonths,
                    colorScheme,
                  ),
                  SizedBox(width: 2.w),
                  _buildPeriodChip(
                    context,
                    '1Y',
                    TimePeriod.oneYear,
                    colorScheme,
                  ),
                  SizedBox(width: 2.w),
                  _buildCustomPeriodChip(context, colorScheme),
                ],
              ),
            ),
          ),
          SizedBox(width: 2.w),
          IconButton(
            onPressed: () => _showDateRangePicker(context),
            icon: CustomIconWidget(
              iconName: 'calendar_today',
              color: colorScheme.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodChip(
    BuildContext context,
    String label,
    TimePeriod period,
    ColorScheme colorScheme,
  ) {
    final isSelected = widget.selectedPeriod == period;

    return GestureDetector(
      onTap: () => widget.onPeriodChanged(period),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
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
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 12.sp,
              ),
        ),
      ),
    );
  }

  Widget _buildCustomPeriodChip(BuildContext context, ColorScheme colorScheme) {
    final isSelected = widget.selectedPeriod == TimePeriod.custom;

    return GestureDetector(
      onTap: () => _showDateRangePicker(context),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
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
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.customRange != null
                  ? _formatDateRange(widget.customRange!)
                  : 'Custom',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 12.sp,
                  ),
            ),
            SizedBox(width: 1.w),
            CustomIconWidget(
              iconName: 'keyboard_arrow_down',
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateRange(DateTimeRange range) {
    final start = range.start;
    final end = range.end;

    if (start.year == end.year) {
      if (start.month == end.month) {
        return '${start.day}-${end.day}/${start.month}';
      } else {
        return '${start.day}/${start.month} - ${end.day}/${end.month}';
      }
    } else {
      return '${start.day}/${start.month}/${start.year.toString().substring(2)} - ${end.day}/${end.month}/${end.year.toString().substring(2)}';
    }
  }

  Future<void> _showDateRangePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 365 * 2)),
      lastDate: DateTime.now(),
      initialDateRange: widget.customRange ??
          DateTimeRange(
            start: DateTime.now().subtract(Duration(days: 30)),
            end: DateTime.now(),
          ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppTheme.lightTheme.primaryColor,
                  onPrimary: Colors.white,
                  surface: Theme.of(context).colorScheme.surface,
                  onSurface: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      widget.onPeriodChanged(TimePeriod.custom);
      if (widget.onCustomRangeChanged != null) {
        widget.onCustomRangeChanged!(picked);
      }
    }
  }
}
