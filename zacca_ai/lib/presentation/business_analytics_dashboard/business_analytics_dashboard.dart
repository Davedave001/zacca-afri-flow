import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import './widgets/chart_card_widget.dart';
import './widgets/export_fab_widget.dart';
import './widgets/metric_card_widget.dart';
import './widgets/time_period_selector_widget.dart';

class BusinessAnalyticsDashboard extends StatefulWidget {
  const BusinessAnalyticsDashboard({super.key});

  @override
  State<BusinessAnalyticsDashboard> createState() =>
      _BusinessAnalyticsDashboardState();
}

class _BusinessAnalyticsDashboardState
    extends State<BusinessAnalyticsDashboard> {
  TimePeriod _selectedPeriod = TimePeriod.thirtyDays;
  DateTimeRange? _customRange;
  bool _isLoading = false;

  // Mock data for metrics
  final List<Map<String, dynamic>> _metricsData = [
    {
      "title": "Revenue Growth",
      "currentValue": "KES 2.4M",
      "previousValue": "KES 2.1M",
      "changePercentage": "+14.3%",
      "isPositive": true,
      "icon": Icons.trending_up,
    },
    {
      "title": "Profit Margin",
      "currentValue": "32.5%",
      "previousValue": "28.7%",
      "changePercentage": "+3.8%",
      "isPositive": true,
      "icon": Icons.account_balance_wallet,
    },
    {
      "title": "Customer Acquisition",
      "currentValue": "156",
      "previousValue": "142",
      "changePercentage": "+9.9%",
      "isPositive": true,
      "icon": Icons.people,
    },
    {
      "title": "Cash Flow",
      "currentValue": "KES 890K",
      "previousValue": "KES 1.2M",
      "changePercentage": "-25.8%",
      "isPositive": false,
      "icon": Icons.water_drop,
    },
  ];

  // Mock data for revenue trend chart
  final List<Map<String, dynamic>> _revenueData = [
    {"label": "Jan", "value": 1800000},
    {"label": "Feb", "value": 2100000},
    {"label": "Mar", "value": 1950000},
    {"label": "Apr", "value": 2300000},
    {"label": "May", "value": 2150000},
    {"label": "Jun", "value": 2400000},
  ];

  // Mock data for expense breakdown
  final List<Map<String, dynamic>> _expenseData = [
    {"label": "Operations", "value": 450000},
    {"label": "Marketing", "value": 280000},
    {"label": "Salaries", "value": 650000},
    {"label": "Utilities", "value": 120000},
    {"label": "Other", "value": 180000},
  ];

  // Mock data for customer payment patterns
  final List<Map<String, dynamic>> _paymentData = [
    {"label": "On Time", "value": 75},
    {"label": "1-7 Days Late", "value": 15},
    {"label": "8-30 Days Late", "value": 8},
    {"label": "30+ Days Late", "value": 2},
  ];

  // Mock data for M-Pesa vs Bank transactions
  final List<Map<String, dynamic>> _transactionData = [
    {"label": "Jan", "mpesa": 1200000, "bank": 600000},
    {"label": "Feb", "mpesa": 1350000, "bank": 750000},
    {"label": "Mar", "mpesa": 1180000, "bank": 770000},
    {"label": "Apr", "mpesa": 1450000, "bank": 850000},
    {"label": "May", "mpesa": 1320000, "bank": 830000},
    {"label": "Jun", "mpesa": 1500000, "bank": 900000},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: 'Analytics',
        variant: CustomAppBarVariant.standard,
        actions: [
          IconButton(
            onPressed: _refreshData,
            icon: CustomIconWidget(
              iconName: 'refresh',
              color: colorScheme.onSurface,
              size: 24,
            ),
          ),
        ],
      ),
      body: _isLoading ? _buildLoadingState() : _buildContent(),
      floatingActionButton: ExportFabWidget(
        onExportPdf: _exportPdfReport,
        onExportCsv: _exportCsvData,
        onShare: _shareReport,
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 4,
        variant: CustomBottomBarVariant.standard,
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppTheme.lightTheme.primaryColor,
          ),
          SizedBox(height: 2.h),
          Text(
            'Loading analytics data...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return CustomScrollView(
      slivers: [
        // Time Period Selector
        SliverToBoxAdapter(
          child: TimePeriodSelectorWidget(
            selectedPeriod: _selectedPeriod,
            onPeriodChanged: _onPeriodChanged,
            customRange: _customRange,
            onCustomRangeChanged: _onCustomRangeChanged,
          ),
        ),

        // Key Performance Indicators
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Text(
                  'Key Performance Indicators',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Container(
                height: 20.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  itemCount: _metricsData.length,
                  itemBuilder: (context, index) {
                    final metric = _metricsData[index];
                    return MetricCardWidget(
                      title: metric['title'] as String,
                      currentValue: metric['currentValue'] as String,
                      previousValue: metric['previousValue'] as String,
                      changePercentage: metric['changePercentage'] as String,
                      isPositive: metric['isPositive'] as bool,
                      icon: metric['icon'] as IconData,
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 2.h).toSliver(),

        // Charts Section
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Text(
              'Financial Insights',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),

        // Revenue Trend Chart
        SliverToBoxAdapter(
          child: ChartCardWidget(
            title: 'Revenue Trend',
            subtitle: 'Monthly revenue over time',
            chartType: ChartType.line,
            data: _revenueData,
            onTap: () => _showDetailedView('Revenue Trend', _revenueData),
          ),
        ),

        // Expense Breakdown Chart
        SliverToBoxAdapter(
          child: ChartCardWidget(
            title: 'Expense Breakdown',
            subtitle: 'Current month expense distribution',
            chartType: ChartType.donut,
            data: _expenseData,
            onTap: () => _showDetailedView('Expense Breakdown', _expenseData),
          ),
        ),

        // Customer Payment Patterns Chart
        SliverToBoxAdapter(
          child: ChartCardWidget(
            title: 'Customer Payment Patterns',
            subtitle: 'Payment timing analysis',
            chartType: ChartType.bar,
            data: _paymentData,
            onTap: () => _showDetailedView('Payment Patterns', _paymentData),
          ),
        ),

        // M-Pesa vs Bank Transaction Volume Chart
        SliverToBoxAdapter(
          child: ChartCardWidget(
            title: 'M-Pesa vs Bank Transactions',
            subtitle: 'Transaction volume comparison',
            chartType: ChartType.stackedArea,
            data: _transactionData,
            onTap: () =>
                _showDetailedView('Transaction Volume', _transactionData),
          ),
        ),

        // Bottom padding for FAB
        SliverToBoxAdapter(
          child: SizedBox(height: 10.h),
        ),
      ],
    );
  }

  void _onPeriodChanged(TimePeriod period) {
    setState(() {
      _selectedPeriod = period;
      _isLoading = true;
    });

    // Simulate data loading
    Future.delayed(Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _onCustomRangeChanged(DateTimeRange range) {
    setState(() {
      _customRange = range;
    });
  }

  void _refreshData() {
    setState(() {
      _isLoading = true;
    });

    // Simulate data refresh
    Future.delayed(Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Analytics data refreshed successfully'),
            backgroundColor: AppTheme.getSuccessColor(
                Theme.of(context).brightness == Brightness.light),
          ),
        );
      }
    });
  }

  void _showDetailedView(String title, List<Map<String, dynamic>> data) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 12.w,
                  height: 0.5.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outline,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: CustomIconWidget(
                      iconName: 'close',
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(
                        item['label']?.toString() ?? 'Item ${index + 1}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      trailing: Text(
                        item['value']?.toString() ?? '0',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.lightTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _exportPdfReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF report exported successfully'),
        backgroundColor: AppTheme.getSuccessColor(
            Theme.of(context).brightness == Brightness.light),
        action: SnackBarAction(
          label: 'View',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  void _exportCsvData() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('CSV data exported successfully'),
        backgroundColor: AppTheme.getSuccessColor(
            Theme.of(context).brightness == Brightness.light),
        action: SnackBarAction(
          label: 'Open',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  void _shareReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Report shared successfully'),
        backgroundColor: AppTheme.lightTheme.colorScheme.secondary,
      ),
    );
  }
}

extension SizedBoxSliver on SizedBox {
  Widget toSliver() => SliverToBoxAdapter(child: this);
}
