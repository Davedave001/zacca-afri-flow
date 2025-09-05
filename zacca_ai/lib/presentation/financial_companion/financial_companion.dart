import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'widgets/expense_tracking_widget.dart';
import 'widgets/invoice_quote_widget.dart';
import 'widgets/inventory_management_widget.dart';
import 'widgets/budget_management_widget.dart';
import 'widgets/tax_management_widget.dart';
import 'widgets/chart_of_accounts_widget.dart';
import 'widgets/role_permissions_widget.dart';
import 'widgets/consent_management_widget.dart';
import 'widgets/workflow_automation_widget.dart';
import 'widgets/custom_dashboard_widget.dart';
import 'widgets/excel_sync_widget.dart';
import 'widgets/revenue_recognition_widget.dart';

class FinancialCompanion extends StatefulWidget {
  const FinancialCompanion({Key? key}) : super(key: key);

  @override
  State<FinancialCompanion> createState() => _FinancialCompanionState();
}

class _FinancialCompanionState extends State<FinancialCompanion>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'Overview',
    'Expenses',
    'Invoices',
    'Inventory',
    'Budgets',
    'Tax & GST',
    'Chart of Accounts',
    'Permissions',
    'Consent',
    'Workflow',
    'Dashboards',
    'Excel Sync',
    'Revenue',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        // Tab changed - could add logic here if needed
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: CustomAppBar(
        title: 'Financial Companion',
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Financial Summary Cards
          _buildFinancialSummary(),
          
          // Tab Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: AppTheme.primaryLight,
              labelColor: Colors.black, // Black text for selected tabs
              unselectedLabelColor: Colors.grey[600], // Darker grey for unselected tabs
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),
          
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                const ExpenseTrackingWidget(),
                const InvoiceQuoteWidget(),
                const InventoryManagementWidget(),
                const BudgetManagementWidget(),
                const TaxManagementWidget(),
                const ChartOfAccountsWidget(),
                const RolePermissionsWidget(),
                const ConsentManagementWidget(),
                const WorkflowAutomationWidget(),
                const CustomDashboardWidget(),
                const ExcelSyncWidget(),
                const RevenueRecognitionWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 3, // Financial Companion tab
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildFinancialSummary() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Main Financial Metrics
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Total Revenue',
                  '\$124,567',
                  '+12.5%',
                  Colors.green,
                  Icons.trending_up,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricCard(
                  'Total Expenses',
                  '\$89,234',
                  '+8.2%',
                  Colors.orange,
                  Icons.trending_down,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Net Profit',
                  '\$35,333',
                  '+18.7%',
                  Colors.blue,
                  Icons.account_balance_wallet,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricCard(
                  'Cash Flow',
                  '\$42,891',
                  '+15.3%',
                  Colors.purple,
                  Icons.swap_horiz,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String change, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            change,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Actions
          _buildSectionTitle('Quick Actions'),
          const SizedBox(height: 12),
          _buildQuickActions(),
          
          const SizedBox(height: 24),
          
          // Recent Transactions
          _buildSectionTitle('Recent Transactions'),
          const SizedBox(height: 12),
          _buildRecentTransactions(),
          
          const SizedBox(height: 24),
          
          // Financial Health Score
          _buildSectionTitle('Financial Health Score'),
          const SizedBox(height: 12),
          _buildFinancialHealthScore(),
          
          const SizedBox(height: 24),
          
          // Upcoming Deadlines
          _buildSectionTitle('Upcoming Deadlines'),
          const SizedBox(height: 12),
          _buildUpcomingDeadlines(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white, // White text for section headers
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.add, 'title': 'New Expense', 'color': Colors.orange},
      {'icon': Icons.receipt, 'title': 'Create Invoice', 'color': Colors.blue},
      {'icon': Icons.inventory, 'title': 'Add Item', 'color': Colors.green},
      {'icon': Icons.account_balance, 'title': 'Budget Review', 'color': Colors.purple},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // Handle action tap
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      action['icon'] as IconData,
                      color: action['color'] as Color,
                      size: 32,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      action['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black, // Black text for action buttons
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecentTransactions() {
    final transactions = [
      {'type': 'Expense', 'description': 'Office Supplies', 'amount': '-\$234.50', 'date': 'Today'},
      {'type': 'Income', 'description': 'Client Payment', 'amount': '+\$1,500.00', 'date': 'Yesterday'},
      {'type': 'Expense', 'description': 'Software License', 'amount': '-\$89.99', 'date': '2 days ago'},
      {'type': 'Income', 'description': 'Consulting Fee', 'amount': '+\$2,000.00', 'date': '3 days ago'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          final isExpense = transaction['type'] == 'Expense';
          
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isExpense ? Colors.red[50] : Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                isExpense ? Icons.remove : Icons.add,
                color: isExpense ? Colors.red : Colors.green,
                size: 20,
              ),
            ),
            title: Text(
              transaction['description'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              transaction['date'] as String,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            trailing: Text(
              transaction['amount'] as String,
              style: TextStyle(
                color: isExpense ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFinancialHealthScore() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Overall Score',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Excellent',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: 0.87,
                  strokeWidth: 12,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Column(
                children: [
                  const Text(
                    '87',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '/100',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHealthMetric('Cash Flow', '92', Colors.green),
              _buildHealthMetric('Profitability', '85', Colors.blue),
              _buildHealthMetric('Efficiency', '78', Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthMetric(String label, String score, Color color) {
    return Column(
      children: [
        Text(
          score,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingDeadlines() {
    final deadlines = [
      {'type': 'Tax Filing', 'date': 'Mar 15, 2024', 'status': 'Due Soon'},
      {'type': 'GST Return', 'date': 'Mar 20, 2024', 'status': 'Upcoming'},
      {'type': 'Budget Review', 'date': 'Mar 25, 2024', 'status': 'Upcoming'},
      {'type': 'Audit', 'date': 'Apr 5, 2024', 'status': 'Upcoming'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: deadlines.length,
        itemBuilder: (context, index) {
          final deadline = deadlines[index];
          final isDueSoon = deadline['status'] == 'Due Soon';
          
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDueSoon ? Colors.red[50] : Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.event,
                color: isDueSoon ? Colors.red : Colors.blue,
                size: 20,
              ),
            ),
            title: Text(
              deadline['type'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              deadline['date'] as String,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isDueSoon ? Colors.red[50] : Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                deadline['status'] as String,
                style: TextStyle(
                  color: isDueSoon ? Colors.red[700] : Colors.blue[700],
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
