import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class BudgetManagementWidget extends StatefulWidget {
  const BudgetManagementWidget({Key? key}) : super(key: key);

  @override
  State<BudgetManagementWidget> createState() => _BudgetManagementWidgetState();
}

class _BudgetManagementWidgetState extends State<BudgetManagementWidget> {
  final List<Map<String, dynamic>> _budgets = [
    {
      'id': 'BUD-001',
      'name': 'Q1 2024 Operating Budget',
      'category': 'Operating',
      'totalBudget': 50000.00,
      'spent': 32450.00,
      'remaining': 17550.00,
      'period': 'Q1 2024',
      'status': 'On Track',
      'departments': [
        {'name': 'Marketing', 'budget': 15000, 'spent': 9800, 'remaining': 5200},
        {'name': 'Technology', 'budget': 20000, 'spent': 12500, 'remaining': 7500},
        {'name': 'Operations', 'budget': 15000, 'spent': 10150, 'remaining': 4850},
      ],
    },
    {
      'id': 'BUD-002',
      'name': 'Marketing Campaign Budget',
      'category': 'Marketing',
      'totalBudget': 25000.00,
      'spent': 18900.00,
      'remaining': 6100.00,
      'period': 'Q1 2024',
      'status': 'Over Budget',
      'departments': [
        {'name': 'Digital Ads', 'budget': 12000, 'spent': 9500, 'remaining': 2500},
        {'name': 'Content Creation', 'budget': 8000, 'spent': 6400, 'remaining': 1600},
        {'name': 'Events', 'budget': 5000, 'spent': 3000, 'remaining': 2000},
      ],
    },
    {
      'id': 'BUD-003',
      'name': 'Technology Infrastructure',
      'category': 'Technology',
      'totalBudget': 35000.00,
      'spent': 18750.00,
      'remaining': 16250.00,
      'period': 'Q1 2024',
      'status': 'Under Budget',
      'departments': [
        {'name': 'Hardware', 'budget': 20000, 'spent': 12000, 'remaining': 8000},
        {'name': 'Software', 'budget': 10000, 'spent': 5000, 'remaining': 5000},
        {'name': 'Services', 'budget': 5000, 'spent': 1750, 'remaining': 3250},
      ],
    },
  ];

  String _selectedCategory = 'All';
  String _selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Action Buttons
          _buildActionButtons(),
          
          const SizedBox(height: 20),
          
          // Filters
          _buildFilters(),
          
          const SizedBox(height: 20),
          
          // Budget Overview
          _buildBudgetOverview(),
          
          const SizedBox(height: 20),
          
          // Budgets List
          _buildBudgetsList(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showCreateBudgetDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Create Budget'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryLight,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showBudgetAnalysisDialog(),
            icon: const Icon(Icons.analytics),
            label: const Text('Budget Analysis'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return Row(
      children: [
        Expanded(
          child: _buildFilterDropdown(
            'Category',
            _selectedCategory,
            ['All', 'Operating', 'Marketing', 'Technology', 'Sales', 'Other'],
            (value) => setState(() => _selectedCategory = value!),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFilterDropdown(
            'Status',
            _selectedStatus,
            ['All', 'On Track', 'Over Budget', 'Under Budget'],
            (value) => setState(() => _selectedStatus = value!),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterDropdown(
    String label,
    String value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetOverview() {
    final totalBudget = _budgets.fold<double>(
      0, (sum, budget) => sum + budget['totalBudget']);
    final totalSpent = _budgets.fold<double>(
      0, (sum, budget) => sum + budget['spent']);
    final totalRemaining = _budgets.fold<double>(
      0, (sum, budget) => sum + budget['remaining']);
    final utilizationRate = (totalSpent / totalBudget) * 100;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildOverviewCard(
                'Total Budget',
                '\$${totalBudget.toStringAsFixed(2)}',
                Colors.blue[50]!,
                Colors.blue,
                Icons.account_balance,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildOverviewCard(
                'Total Spent',
                '\$${totalSpent.toStringAsFixed(2)}',
                Colors.orange[50]!,
                Colors.orange,
                Icons.payments,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildOverviewCard(
                'Remaining',
                '\$${totalRemaining.toStringAsFixed(2)}',
                Colors.green[50]!,
                Colors.green,
                Icons.savings,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildOverviewCard(
                'Utilization',
                '${utilizationRate.toStringAsFixed(1)}%',
                Colors.purple[50]!,
                Colors.purple,
                Icons.trending_up,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverviewCard(
    String title,
    String value,
    Color backgroundColor,
    Color textColor,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textColor.withValues(alpha:0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: textColor, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetsList() {
    final filteredBudgets = _budgets.where((budget) {
      final categoryMatch = _selectedCategory == 'All' || 
                           budget['category'] == _selectedCategory;
      final statusMatch = _selectedStatus == 'All' || 
                         budget['status'] == _selectedStatus;
      return categoryMatch && statusMatch;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Budgets (${filteredBudgets.length})',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredBudgets.length,
          itemBuilder: (context, index) {
            final budget = filteredBudgets[index];
            return _buildBudgetCard(budget);
          },
        ),
      ],
    );
  }

  Widget _buildBudgetCard(Map<String, dynamic> budget) {
    final statusColor = _getStatusColor(budget['status']);
    final utilizationRate = (budget['spent'] / budget['totalBudget']) * 100;
    final isOverBudget = utilizationRate > 100;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _getCategoryColor(budget['category']).withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCategoryIcon(budget['category']),
            color: _getCategoryColor(budget['category']),
            size: 24,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                budget['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                budget['status'],
                style: TextStyle(
                  color: statusColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${budget['category']} • ${budget['period']}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            // Progress Bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Utilization: ${utilizationRate.toStringAsFixed(1)}%',
                      style: TextStyle(
                        color: isOverBudget ? Colors.red : Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${budget['spent'].toStringAsFixed(2)} / \$${budget['totalBudget'].toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: utilizationRate > 100 ? 1.0 : utilizationRate / 100,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isOverBudget ? Colors.red : 
                    utilizationRate > 80 ? Colors.orange : Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildBudgetMetric(
                    'Spent',
                    '\$${budget['spent'].toStringAsFixed(2)}',
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildBudgetMetric(
                    'Remaining',
                    '\$${budget['remaining'].toStringAsFixed(2)}',
                    budget['remaining'] < 0 ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () => _showBudgetDetails(budget),
      ),
    );
  }

  Widget _buildBudgetMetric(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'On Track':
        return Colors.green;
      case 'Over Budget':
        return Colors.red;
      case 'Under Budget':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Operating':
        return Colors.blue;
      case 'Marketing':
        return Colors.purple;
      case 'Technology':
        return Colors.indigo;
      case 'Sales':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Operating':
        return Icons.business;
      case 'Marketing':
        return Icons.campaign;
      case 'Technology':
        return Icons.computer;
      case 'Sales':
        return Icons.trending_up;
      default:
        return Icons.category;
    }
  }

  void _showCreateBudgetDialog() {
    showDialog(
      context: context,
      builder: (context) => const CreateBudgetDialog(),
    );
  }

  void _showBudgetAnalysisDialog() {
    showDialog(
      context: context,
      builder: (context) => const BudgetAnalysisDialog(),
    );
  }

  void _showBudgetDetails(Map<String, dynamic> budget) {
    showDialog(
      context: context,
      builder: (context) => BudgetDetailsDialog(budget: budget),
    );
  }
}

class CreateBudgetDialog extends StatefulWidget {
  const CreateBudgetDialog({Key? key}) : super(key: key);

  @override
  State<CreateBudgetDialog> createState() => _CreateBudgetDialogState();
}

class _CreateBudgetDialogState extends State<CreateBudgetDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _totalBudgetController = TextEditingController();
  String _selectedCategory = 'Operating';
  String _selectedPeriod = 'Q1 2024';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Budget'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Budget Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter budget name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Operating', 'Marketing', 'Technology', 'Sales', 'Other']
                        .map<DropdownMenuItem<String>>((category) => DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _selectedPeriod,
                    decoration: const InputDecoration(
                      labelText: 'Period',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Q1 2024', 'Q2 2024', 'Q3 2024', 'Q4 2024', '2024 Annual']
                        .map<DropdownMenuItem<String>>((period) => DropdownMenuItem<String>(
                              value: period,
                              child: Text(period),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPeriod = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _totalBudgetController,
              decoration: const InputDecoration(
                labelText: 'Total Budget',
                border: OutlineInputBorder(),
                prefixText: '\$',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter total budget';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid amount';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Handle budget creation
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create Budget'),
        ),
      ],
    );
  }
}

class BudgetAnalysisDialog extends StatelessWidget {
  const BudgetAnalysisDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Budget Analysis'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Budget analysis features will be implemented here, including:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            '• Variance Analysis\n'
            '• Trend Analysis\n'
            '• Forecasting\n'
            '• Performance Metrics\n'
            '• Comparative Analysis',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class BudgetDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> budget;

  const BudgetDetailsDialog({
    Key? key,
    required this.budget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(budget['name']),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Category', budget['category']),
            _buildDetailRow('Period', budget['period']),
            _buildDetailRow('Total Budget', '\$${budget['totalBudget'].toStringAsFixed(2)}'),
            _buildDetailRow('Spent', '\$${budget['spent'].toStringAsFixed(2)}'),
            _buildDetailRow('Remaining', '\$${budget['remaining'].toStringAsFixed(2)}'),
            _buildDetailRow('Status', budget['status']),
            const SizedBox(height: 16),
            const Text(
              'Department Breakdown:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            ...budget['departments'].map<Widget>((dept) => _buildDepartmentRow(dept)),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle edit
            Navigator.of(context).pop();
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentRow(Map<String, dynamic> dept) {
    final utilizationRate = (dept['spent'] / dept['budget']) * 100;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dept['name'],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                '${utilizationRate.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: utilizationRate > 100 ? Colors.red : Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Budget: \$${dept['budget'].toStringAsFixed(2)}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                'Spent: \$${dept['spent'].toStringAsFixed(2)}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                'Remaining: \$${dept['remaining'].toStringAsFixed(2)}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
