import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

enum ChartType { line, donut, bar, stackedArea }

class ChartCardWidget extends StatefulWidget {
  final String title;
  final ChartType chartType;
  final List<Map<String, dynamic>> data;
  final VoidCallback? onTap;
  final String? subtitle;

  const ChartCardWidget({
    super.key,
    required this.title,
    required this.chartType,
    required this.data,
    this.onTap,
    this.subtitle,
  });

  @override
  State<ChartCardWidget> createState() => _ChartCardWidgetState();
}

class _ChartCardWidgetState extends State<ChartCardWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.subtitle != null) ...[
                        SizedBox(height: 0.5.h),
                        Text(
                          widget.subtitle!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => _showChartOptions(context),
                  icon: CustomIconWidget(
                    iconName: 'more_vert',
                    color: colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              height: 30.h,
              child: _buildChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    switch (widget.chartType) {
      case ChartType.line:
        return _buildLineChart();
      case ChartType.donut:
        return _buildDonutChart();
      case ChartType.bar:
        return _buildBarChart();
      case ChartType.stackedArea:
        return _buildStackedAreaChart();
    }
  }

  Widget _buildLineChart() {
    final spots = widget.data.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      return FlSpot(index.toDouble(), (item['value'] as num).toDouble());
    }).toList();

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                final index = value.toInt();
                if (index >= 0 && index < widget.data.length) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      widget.data[index]['label'] ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10.sp,
                          ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  value.toInt().toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                      ),
                );
              },
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: (widget.data.length - 1).toDouble(),
        minY: 0,
        maxY: spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) * 1.2,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                AppTheme.lightTheme.primaryColor,
                AppTheme.lightTheme.primaryColor.withValues(alpha: 0.3),
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: AppTheme.lightTheme.primaryColor,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppTheme.lightTheme.primaryColor.withValues(alpha: 0.3),
                  AppTheme.lightTheme.primaryColor.withValues(alpha: 0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonutChart() {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(show: false),
        sectionsSpace: 2,
        centerSpaceRadius: 60,
        sections: widget.data.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isTouched = index == touchedIndex;
          final fontSize = isTouched ? 16.0 : 12.0;
          final radius = isTouched ? 80.0 : 70.0;

          final colors = [
            AppTheme.lightTheme.primaryColor,
            AppTheme.lightTheme.colorScheme.secondary,
            AppTheme.getSuccessColor(true),
            AppTheme.getWarningColor(true),
            AppTheme.getErrorColor(true),
          ];

          return PieChartSectionData(
            color: colors[index % colors.length],
            value: (item['value'] as num).toDouble(),
            title:
                '${((item['value'] as num) / widget.data.fold<num>(0, (sum, item) => sum + (item['value'] as num)) * 100).toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: widget.data
                .map((item) => (item['value'] as num).toDouble())
                .reduce((a, b) => a > b ? a : b) *
            1.2,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor:
                Theme.of(context).colorScheme.inverseSurface,
            tooltipHorizontalAlignment: FLHorizontalAlignment.center,
            tooltipMargin: -10,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${widget.data[group.x]['label']}\n',
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      fontWeight: FontWeight.bold,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: rod.toY.round().toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                        ),
                  ),
                ],
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                final index = value.toInt();
                if (index >= 0 && index < widget.data.length) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      widget.data[index]['label'] ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10.sp,
                          ),
                    ),
                  );
                }
                return Container();
              },
              reservedSize: 38,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  value.toInt().toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                      ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: widget.data.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: (item['value'] as num).toDouble(),
                gradient: LinearGradient(
                  colors: [
                    AppTheme.lightTheme.primaryColor,
                    AppTheme.lightTheme.primaryColor.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: 20,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          );
        }).toList(),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              strokeWidth: 1,
            );
          },
        ),
      ),
    );
  }

  Widget _buildStackedAreaChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                final index = value.toInt();
                if (index >= 0 && index < widget.data.length) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      widget.data[index]['label'] ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10.sp,
                          ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  value.toInt().toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                      ),
                );
              },
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: (widget.data.length - 1).toDouble(),
        minY: 0,
        maxY: widget.data
                .map((item) => (item['mpesa'] as num) + (item['bank'] as num))
                .reduce((a, b) => a > b ? a : b)
                .toDouble() *
            1.2,
        lineBarsData: [
          // M-Pesa data
          LineChartBarData(
            spots: widget.data.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return FlSpot(
                  index.toDouble(), (item['mpesa'] as num).toDouble());
            }).toList(),
            isCurved: true,
            color: AppTheme.lightTheme.primaryColor,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: AppTheme.lightTheme.primaryColor.withValues(alpha: 0.3),
            ),
          ),
          // Bank data (stacked)
          LineChartBarData(
            spots: widget.data.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return FlSpot(
                  index.toDouble(),
                  (item['mpesa'] as num).toDouble() +
                      (item['bank'] as num).toDouble());
            }).toList(),
            isCurved: true,
            color: AppTheme.lightTheme.colorScheme.secondary,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: AppTheme.lightTheme.colorScheme.secondary
                  .withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }

  void _showChartOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CustomIconWidget(
                iconName: 'zoom_in',
                color: Theme.of(context).colorScheme.onSurface,
                size: 24,
              ),
              title: Text('View Details'),
              onTap: () {
                Navigator.pop(context);
                if (widget.onTap != null) widget.onTap!();
              },
            ),
            ListTile(
              leading: CustomIconWidget(
                iconName: 'share',
                color: Theme.of(context).colorScheme.onSurface,
                size: 24,
              ),
              title: Text('Share Chart'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: CustomIconWidget(
                iconName: 'download',
                color: Theme.of(context).colorScheme.onSurface,
                size: 24,
              ),
              title: Text('Export Data'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}