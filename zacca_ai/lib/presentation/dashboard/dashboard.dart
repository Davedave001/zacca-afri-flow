import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import './widgets/business_health_score_widget.dart';
import './widgets/metric_card_widget.dart';
import './widgets/recent_activity_widget.dart';
import './widgets/sync_status_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  bool _isOnline = true;
  DateTime _lastSyncTime = DateTime.now().subtract(Duration(minutes: 5));
  List<Map<String, dynamic>> _recentActivities = [];

  // M-Pesa style service categories
  final List<Map<String, dynamic>> _serviceCategories = [
    {
      "title": "Financial Services",
      "services": [
        {
          "name": "Financial Companion",
          "icon": Icons.account_balance_wallet,
          "color": Colors.green,
          "route": "/financial-companion",
        },
        {
          "name": "Loan Offers",
          "icon": Icons.account_balance,
          "color": Colors.blue,
          "route": "/loan-offers-screen",
        },
        {
          "name": "Business Analytics",
          "icon": Icons.trending_up,
          "color": Colors.purple,
          "route": "/business-analytics-dashboard",
        },
        {
          "name": "M-PESA Balance",
          "icon": Icons.phone_android,
          "color": Colors.green,
          "route": "/financial-companion",
        },
      ],
    },
    {
      "title": "Business Tools",
      "services": [
        {
          "name": "WhatsApp Import",
          "icon": Icons.chat_bubble,
          "color": Colors.green,
          "route": "/whats-app-import-screen",
        },
        {
          "name": "Smart Drafts",
          "icon": Icons.inbox,
          "color": Colors.orange,
          "route": "/smart-draft-inbox",
        },
        {
          "name": "SDR Vault",
          "icon": Icons.folder,
          "color": Colors.blue,
          "route": "/sdr-vault",
        },
        {
          "name": "Invoice Generator",
          "icon": Icons.receipt,
          "color": Colors.red,
          "route": "/financial-companion",
        },
      ],
    },
    {
      "title": "Quick Actions",
      "services": [
        {
          "name": "Send Money",
          "icon": Icons.send,
          "color": Colors.green,
          "route": "/financial-companion",
        },
        {
          "name": "Pay Bills",
          "icon": Icons.payment,
          "color": Colors.blue,
          "route": "/financial-companion",
        },
        {
          "name": "Buy Airtime",
          "icon": Icons.phone,
          "color": Colors.orange,
          "route": "/financial-companion",
        },
        {
          "name": "Withdraw Cash",
          "icon": Icons.account_balance_wallet,
          "color": Colors.red,
          "route": "/financial-companion",
        },
      ],
    },
  ];

  // Mock data for business metrics
  final List<Map<String, dynamic>> _mockMetrics = [
    {
      "id": 1,
      "title": "MONTHLY REVENUE",
      "value": "KES 125,400",
      "subtitle": "+12% from last month",
      "icon": "trending_up",
      "color": null,
    },
    {
      "id": 2,
      "title": "OUTSTANDING INVOICES",
      "value": "KES 45,200",
      "subtitle": "8 pending invoices",
      "icon": "receipt_long",
      "color": null,
    },
    {
      "id": 3,
      "title": "LOAN OFFERS",
      "value": "3 Available",
      "subtitle": "Up to KES 500K",
      "icon": "account_balance",
      "color": null,
    },
    {
      "id": 4,
      "title": "M-PESA BALANCE",
      "value": "KES 28,750",
      "subtitle": "Last updated 2h ago",
      "icon": "account_balance_wallet",
      "color": null,
    },
  ];

  final List<Map<String, dynamic>> _mockActivities = [
    {
      "id": 1,
      "type": "payment",
      "title": "Payment Received",
      "description": "From John Kamau - Invoice #INV-001",
      "amount": "+KES 15,000",
      "time": "2h ago",
    },
    {
      "id": 2,
      "type": "expense",
      "title": "Supplier Payment",
      "description": "To ABC Suppliers - Stock purchase",
      "amount": "-KES 8,500",
      "time": "4h ago",
    },
    {
      "id": 3,
      "type": "invoice",
      "title": "Invoice Created",
      "description": "For Mary Wanjiku - Service delivery",
      "amount": "KES 12,000",
      "time": "6h ago",
    },
  ];

  @override
  void initState() {
    super.initState();
    _recentActivities = List.from(_mockActivities);
    _simulateNetworkStatus();
  }

  void _simulateNetworkStatus() {
    // Simulate network connectivity changes
    Future.delayed(Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          _isOnline = !_isOnline;
        });
        _simulateNetworkStatus();
      }
    });
  }

  Future<void> _onRefresh() async {
    HapticFeedback.lightImpact();

    // Simulate data refresh
    await Future.delayed(Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _lastSyncTime = DateTime.now();
        // Simulate new activity
        if (_recentActivities.length < 5) {
          _recentActivities.insert(0, {
            "id": DateTime.now().millisecondsSinceEpoch,
            "type": "payment",
            "title": "New Payment Received",
            "description": "From recent WhatsApp import",
            "amount": "+KES 5,200",
            "time": "Just now",
          });
        }
      });
    }
  }

  void _onArchiveActivity(int index) {
    HapticFeedback.selectionClick();
    setState(() {
      _recentActivities.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Activity archived'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Implement undo functionality
          },
        ),
      ),
    );
  }

  void _showMetricDetails(String title, String value) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        builder: (context, scrollController) => Container(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 12.w,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 1.h),
              Text(
                value,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.lightTheme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 3.h),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detailed Breakdown',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      SizedBox(height: 2.h),
                      _buildDetailItem('This Month', 'KES 125,400'),
                      _buildDetailItem('Last Month', 'KES 112,000'),
                      _buildDetailItem('Growth Rate', '+12%'),
                      _buildDetailItem('Average Daily', 'KES 4,180'),
                      _buildDetailItem('Peak Day', 'KES 8,500'),
                      SizedBox(height: 3.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, '/business-analytics-dashboard');
                          },
                          child: Text('View Full Analytics'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCategory(Map<String, dynamic> category) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category['title'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'View all',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          
          // Services Grid
          Container(
            height: 20.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 4.w),
              itemCount: category['services'].length,
              itemBuilder: (context, index) {
                final service = category['services'][index];
                return Container(
                  width: 20.w,
                  margin: EdgeInsets.only(right: 4.w),
                  child: Column(
                    children: [
                      // Service Icon
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          Navigator.pushNamed(context, service['route']);
                        },
                        child: Container(
                          width: 15.w,
                          height: 15.w,
                          decoration: BoxDecoration(
                            color: service['color'].withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(15.w / 2),
                            border: Border.all(
                              color: service['color'].withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            service['icon'],
                            color: service['color'],
                            size: 7.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      
                      // Service Name
                      Text(
                        service['name'],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        variant: CustomAppBarVariant.dashboard,
        showNotificationBadge: true,
        onNotificationTap: () {
          Navigator.pushNamed(context, '/smart-draft-inbox');
        },
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sync Status
              SyncStatusWidget(
                isOnline: _isOnline,
                lastSyncTime: _lastSyncTime,
                onRefresh: _onRefresh,
              ),

              // Business Health Score
              BusinessHealthScoreWidget(
                score: 78.5,
                trend: 'up',
                onTap: () =>
                    _showMetricDetails('Business Health Score', '78.5%'),
              ),

              // Key Metrics Cards
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  'Key Metrics',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: 20.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 4.w),
                  itemCount: _mockMetrics.length,
                  itemBuilder: (context, index) {
                    final metric = _mockMetrics[index];
                    return MetricCardWidget(
                      title: metric['title'] as String,
                      value: metric['value'] as String,
                      subtitle: metric['subtitle'] as String,
                      iconName: metric['icon'] as String,
                      iconColor: metric['color'] as Color?,
                      onTap: () => _showMetricDetails(
                        metric['title'] as String,
                        metric['value'] as String,
                      ),
                      onLongPress: () => _showMetricDetails(
                        metric['title'] as String,
                        metric['value'] as String,
                      ),
                    );
                  },
                ),
              ),

              // Service Categories (M-Pesa style)
              ..._serviceCategories.map((category) => _buildServiceCategory(category)).toList(),

              // Recent Activity
              SizedBox(height: 3.h),
              RecentActivityWidget(
                activities: _recentActivities,
                onArchive: _onArchiveActivity,
              ),

              SizedBox(height: 10.h), // Bottom padding for FAB
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          HapticFeedback.mediumImpact();
          Navigator.pushNamed(context, '/whats-app-import-screen');
        },
        icon: CustomIconWidget(
          iconName: 'chat',
          color: colorScheme.onPrimary,
          size: 20,
        ),
        label: Text(
          'Import Chat',
          style: theme.textTheme.labelLarge?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 0,
        variant: CustomBottomBarVariant.standard,
        onTap: (index) {
          HapticFeedback.selectionClick();
        },
      ),
    );
  }
}