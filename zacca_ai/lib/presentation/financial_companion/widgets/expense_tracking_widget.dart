import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class ExpenseTrackingWidget extends StatefulWidget {
  const ExpenseTrackingWidget({Key? key}) : super(key: key);

  @override
  State<ExpenseTrackingWidget> createState() => _ExpenseTrackingWidgetState();
}

class _ExpenseTrackingWidgetState extends State<ExpenseTrackingWidget> {
  final List<Map<String, dynamic>> _expenses = [
    {
      'id': '1',
      'description': 'Office Supplies',
      'amount': 234.50,
      'category': 'Office',
      'date': '2024-03-10',
      'status': 'Approved',
      'receipt': 'receipt_1.jpg',
      'currency': 'USD',
    },
    {
      'id': '2',
      'description': 'Software License',
      'amount': 89.99,
      'category': 'Technology',
      'date': '2024-03-09',
      'status': 'Pending',
      'receipt': 'receipt_2.jpg',
      'currency': 'USD',
    },
    {
      'id': '3',
      'description': 'Business Lunch',
      'amount': 45.00,
      'category': 'Meals',
      'date': '2024-03-08',
      'status': 'Approved',
      'receipt': 'receipt_3.jpg',
      'currency': 'USD',
    },
  ];

  final List<String> _categories = [
    'Office',
    'Technology',
    'Meals',
    'Travel',
    'Marketing',
    'Utilities',
    'Insurance',
    'Other',
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
          // Add Expense Button
          _buildAddExpenseButton(),
          
          const SizedBox(height: 20),
          
          // Filters
          _buildFilters(),
          
          const SizedBox(height: 20),
          
          // Expense Summary
          _buildExpenseSummary(),
          
          const SizedBox(height: 20),
          
          // Expenses List
          _buildExpensesList(),
        ],
      ),
    );
  }

  Widget _buildAddExpenseButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _showAddExpenseDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Add New Expense'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      children: [
        Expanded(
          child: _buildFilterDropdown(
            'Category',
            _selectedCategory,
            ['All', ..._categories],
            (value) => setState(() => _selectedCategory = value!),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFilterDropdown(
            'Status',
            _selectedStatus,
            ['All', 'Pending', 'Approved', 'Rejected'],
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

  Widget _buildExpenseSummary() {
    final totalExpenses = _expenses.fold<double>(
      0, (sum, expense) => sum + expense['amount']);
    final pendingExpenses = _expenses
        .where((expense) => expense['status'] == 'Pending')
        .fold<double>(0, (sum, expense) => sum + expense['amount']);

    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            'Total Expenses',
            '\$${totalExpenses.toStringAsFixed(2)}',
            Colors.red[50]!,
            Colors.red,
            Icons.account_balance_wallet,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSummaryCard(
            'Pending Approval',
            '\$${pendingExpenses.toStringAsFixed(2)}',
            Colors.orange[50]!,
            Colors.orange,
            Icons.pending,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
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
        border: Border.all(color: textColor.withOpacity(0.2)),
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

  Widget _buildExpensesList() {
    final filteredExpenses = _expenses.where((expense) {
      final categoryMatch = _selectedCategory == 'All' || 
                           expense['category'] == _selectedCategory;
      final statusMatch = _selectedStatus == 'All' || 
                         expense['status'] == _selectedStatus;
      return categoryMatch && statusMatch;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expenses (${filteredExpenses.length})',
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
          itemCount: filteredExpenses.length,
          itemBuilder: (context, index) {
            final expense = filteredExpenses[index];
            return _buildExpenseCard(expense);
          },
        ),
      ],
    );
  }

  Widget _buildExpenseCard(Map<String, dynamic> expense) {
    final statusColor = _getStatusColor(expense['status']);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
            color: _getCategoryColor(expense['category']).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCategoryIcon(expense['category']),
            color: _getCategoryColor(expense['category']),
            size: 24,
          ),
        ),
        title: Text(
          expense['description'],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${expense['category']} • ${expense['date']}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    expense['status'],
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (expense['receipt'] != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.receipt, size: 12, color: Colors.blue[700]),
                        const SizedBox(width: 4),
                        Text(
                          'Receipt',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${expense['amount'].toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            Text(
              expense['currency'],
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        onTap: () => _showExpenseDetails(expense),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Office':
        return Colors.blue;
      case 'Technology':
        return Colors.purple;
      case 'Meals':
        return Colors.orange;
      case 'Travel':
        return Colors.teal;
      case 'Marketing':
        return Colors.pink;
      case 'Utilities':
        return Colors.indigo;
      case 'Insurance':
        return Colors.cyan;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Office':
        return Icons.business;
      case 'Technology':
        return Icons.computer;
      case 'Meals':
        return Icons.restaurant;
      case 'Travel':
        return Icons.flight;
      case 'Marketing':
        return Icons.campaign;
      case 'Utilities':
        return Icons.electrical_services;
      case 'Insurance':
        return Icons.security;
      default:
        return Icons.category;
    }
  }

  void _showAddExpenseDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddExpenseDialog(),
    );
  }

  void _showExpenseDetails(Map<String, dynamic> expense) {
    showDialog(
      context: context,
      builder: (context) => ExpenseDetailsDialog(expense: expense),
    );
  }
}

class AddExpenseDialog extends StatefulWidget {
  const AddExpenseDialog({Key? key}) : super(key: key);

  @override
  State<AddExpenseDialog> createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedCategory = 'Office';
  String _selectedCurrency = 'USD';
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Expense'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Office', 'Technology', 'Meals', 'Travel', 'Marketing', 'Utilities', 'Insurance', 'Other']
                          .map((category) => DropdownMenuItem(
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
                      value: _selectedCurrency,
                      decoration: const InputDecoration(
                        labelText: 'Currency',
                        border: OutlineInputBorder(),
                      ),
                      items: ['USD', 'EUR', 'GBP', 'CAD', 'AUD']
                          .map((currency) => DropdownMenuItem(
                                value: currency,
                                child: Text(currency),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCurrency = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Date'),
                subtitle: Text(
                  '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() {
                      _selectedDate = date;
                    });
                  }
                },
              ),
            ],
          ),
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
              // Handle expense creation
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add Expense'),
        ),
      ],
    );
  }
}

class ExpenseDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> expense;

  const ExpenseDetailsDialog({
    Key? key,
    required this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(expense['description']),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Amount', '\$${expense['amount'].toStringAsFixed(2)}'),
          _buildDetailRow('Category', expense['category']),
          _buildDetailRow('Date', expense['date']),
          _buildDetailRow('Status', expense['status']),
          _buildDetailRow('Currency', expense['currency']),
          if (expense['receipt'] != null)
            _buildDetailRow('Receipt', expense['receipt']),
        ],
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
            width: 80,
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
}
