import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class InvoiceQuoteWidget extends StatefulWidget {
  const InvoiceQuoteWidget({Key? key}) : super(key: key);

  @override
  State<InvoiceQuoteWidget> createState() => _InvoiceQuoteWidgetState();
}

class _InvoiceQuoteWidgetState extends State<InvoiceQuoteWidget> {
  final List<Map<String, dynamic>> _invoices = [
    {
      'id': 'INV-001',
      'client': 'Tech Solutions Inc.',
      'amount': 2500.00,
      'status': 'Paid',
      'dueDate': '2024-03-15',
      'issueDate': '2024-03-01',
      'type': 'Invoice',
      'currency': 'USD',
      'items': [
        {'description': 'Web Development', 'quantity': 1, 'rate': 2000.00, 'amount': 2000.00},
        {'description': 'UI/UX Design', 'quantity': 1, 'rate': 500.00, 'amount': 500.00},
      ],
    },
    {
      'id': 'QUOTE-001',
      'client': 'Digital Marketing Co.',
      'amount': 1800.00,
      'status': 'Pending',
      'dueDate': '2024-03-30',
      'issueDate': '2024-03-05',
      'type': 'Quote',
      'currency': 'USD',
      'items': [
        {'description': 'SEO Services', 'quantity': 3, 'rate': 600.00, 'amount': 1800.00},
      ],
    },
    {
      'id': 'INV-002',
      'client': 'Startup Ventures',
      'amount': 3200.00,
      'status': 'Overdue',
      'dueDate': '2024-02-28',
      'issueDate': '2024-02-15',
      'type': 'Invoice',
      'currency': 'USD',
      'items': [
        {'description': 'Mobile App Development', 'quantity': 1, 'rate': 3200.00, 'amount': 3200.00},
      ],
    },
  ];

  String _selectedStatus = 'All';
  String _selectedType = 'All';

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
          
          // Summary Cards
          _buildSummaryCards(),
          
          const SizedBox(height: 20),
          
          // Invoices/Quotes List
          _buildInvoicesList(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showCreateInvoiceDialog(),
            icon: const Icon(Icons.receipt),
            label: const Text('Create Invoice'),
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
            onPressed: () => _showCreateQuoteDialog(),
            icon: const Icon(Icons.description),
            label: const Text('Create Quote'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
            'Status',
            _selectedStatus,
            ['All', 'Draft', 'Sent', 'Viewed', 'Paid', 'Overdue', 'Cancelled'],
            (value) => setState(() => _selectedStatus = value!),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFilterDropdown(
            'Type',
            _selectedType,
            ['All', 'Invoice', 'Quote'],
            (value) => setState(() => _selectedType = value!),
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

  Widget _buildSummaryCards() {
    final totalInvoices = _invoices.where((inv) => inv['type'] == 'Invoice').length;
    final totalQuotes = _invoices.where((inv) => inv['type'] == 'Quote').length;
    final totalAmount = _invoices.fold<double>(0, (sum, inv) => sum + inv['amount']);
    final overdueAmount = _invoices
        .where((inv) => inv['status'] == 'Overdue')
        .fold<double>(0, (sum, inv) => sum + inv['amount']);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Total Invoices',
                totalInvoices.toString(),
                Colors.blue[50]!,
                Colors.blue,
                Icons.receipt,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Total Quotes',
                totalQuotes.toString(),
                Colors.green[50]!,
                Colors.green,
                Icons.description,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Total Amount',
                '\$${totalAmount.toStringAsFixed(2)}',
                Colors.purple[50]!,
                Colors.purple,
                Icons.account_balance_wallet,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Overdue Amount',
                '\$${overdueAmount.toStringAsFixed(2)}',
                Colors.red[50]!,
                Colors.red,
                Icons.warning,
              ),
            ),
          ],
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

  Widget _buildInvoicesList() {
    final filteredInvoices = _invoices.where((invoice) {
      final statusMatch = _selectedStatus == 'All' || 
                         invoice['status'] == _selectedStatus;
      final typeMatch = _selectedType == 'All' || 
                       invoice['type'] == _selectedType;
      return statusMatch && typeMatch;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Invoices & Quotes (${filteredInvoices.length})',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text for header
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredInvoices.length,
          itemBuilder: (context, index) {
            final invoice = filteredInvoices[index];
            return _buildInvoiceCard(invoice);
          },
        ),
      ],
    );
  }

  Widget _buildInvoiceCard(Map<String, dynamic> invoice) {
    final statusColor = _getStatusColor(invoice['status']);
    final isOverdue = invoice['status'] == 'Overdue';
    final dueDate = DateTime.parse(invoice['dueDate']);
    final daysUntilDue = dueDate.difference(DateTime.now()).inDays;
    
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
            color: _getTypeColor(invoice['type']).withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getTypeIcon(invoice['type']),
            color: _getTypeColor(invoice['type']),
            size: 24,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                invoice['id'],
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
                invoice['status'],
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
              invoice['client'],
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Flexible(
                  child: Text(
                    'Due: ${invoice['dueDate']}',
                    style: TextStyle(
                      color: isOverdue ? Colors.red : Colors.grey[600],
                      fontSize: 12,
                      fontWeight: isOverdue ? FontWeight.w600 : FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    '${invoice['items'].length} items',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            if (isOverdue) ...[
              const SizedBox(height: 4),
              Text(
                'Overdue by ${daysUntilDue.abs()} days',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${invoice['amount'].toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isOverdue ? Colors.red : Colors.green,
              ),
            ),
            Text(
              invoice['currency'],
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        onTap: () => _showInvoiceDetails(invoice),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Paid':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Overdue':
        return Colors.red;
      case 'Draft':
        return Colors.grey;
      case 'Sent':
        return Colors.blue;
      case 'Viewed':
        return Colors.purple;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Invoice':
        return Colors.blue;
      case 'Quote':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'Invoice':
        return Icons.receipt;
      case 'Quote':
        return Icons.description;
      default:
        return Icons.description;
    }
  }

  void _showCreateInvoiceDialog() {
    showDialog(
      context: context,
      builder: (context) => const CreateInvoiceDialog(),
    );
  }

  void _showCreateQuoteDialog() {
    showDialog(
      context: context,
      builder: (context) => const CreateQuoteDialog(),
    );
  }

  void _showInvoiceDetails(Map<String, dynamic> invoice) {
    showDialog(
      context: context,
      builder: (context) => InvoiceDetailsDialog(invoice: invoice),
    );
  }
}

class CreateInvoiceDialog extends StatefulWidget {
  const CreateInvoiceDialog({Key? key}) : super(key: key);

  @override
  State<CreateInvoiceDialog> createState() => _CreateInvoiceDialogState();
}

class _CreateInvoiceDialogState extends State<CreateInvoiceDialog> {
  final _formKey = GlobalKey<FormState>();
  final _clientController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _dueDate = DateTime.now().add(const Duration(days: 30));
  String _selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Invoice'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _clientController,
                decoration: const InputDecoration(
                  labelText: 'Client Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter client name';
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
                      initialValue: _selectedCurrency,
                      decoration: const InputDecoration(
                        labelText: 'Currency',
                        border: OutlineInputBorder(),
                      ),
                      items: ['USD', 'EUR', 'GBP', 'CAD', 'AUD']
                          .map<DropdownMenuItem<String>>((currency) => DropdownMenuItem<String>(
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: ListTile(
                      title: const Text('Due Date'),
                      subtitle: Text(
                        '${_dueDate.year}-${_dueDate.month.toString().padLeft(2, '0')}-${_dueDate.day.toString().padLeft(2, '0')}',
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _dueDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          setState(() {
                            _dueDate = date;
                          });
                        }
                      },
                    ),
                  ),
                ],
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
              // Handle invoice creation
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create Invoice'),
        ),
      ],
    );
  }
}

class CreateQuoteDialog extends StatefulWidget {
  const CreateQuoteDialog({Key? key}) : super(key: key);

  @override
  State<CreateQuoteDialog> createState() => _CreateQuoteDialogState();
}

class _CreateQuoteDialogState extends State<CreateQuoteDialog> {
  final _formKey = GlobalKey<FormState>();
  final _clientController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _expiryDate = DateTime.now().add(const Duration(days: 30));
  String _selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Quote'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _clientController,
                decoration: const InputDecoration(
                  labelText: 'Client Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter client name';
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
                      initialValue: _selectedCurrency,
                      decoration: const InputDecoration(
                        labelText: 'Currency',
                        border: OutlineInputBorder(),
                      ),
                      items: ['USD', 'EUR', 'GBP', 'CAD', 'AUD']
                          .map<DropdownMenuItem<String>>((currency) => DropdownMenuItem<String>(
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: ListTile(
                      title: const Text('Expiry Date'),
                      subtitle: Text(
                        '${_expiryDate.year}-${_expiryDate.month.toString().padLeft(2, '0')}-${_expiryDate.day.toString().padLeft(2, '0')}',
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _expiryDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          setState(() {
                            _expiryDate = date;
                          });
                        }
                      },
                    ),
                  ),
                ],
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
              // Handle quote creation
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create Quote'),
        ),
      ],
    );
  }
}

class InvoiceDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> invoice;

  const InvoiceDetailsDialog({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(invoice['id']),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Client', invoice['client']),
            _buildDetailRow('Amount', '\$${invoice['amount'].toStringAsFixed(2)}'),
            _buildDetailRow('Status', invoice['status']),
            _buildDetailRow('Type', invoice['type']),
            _buildDetailRow('Issue Date', invoice['issueDate']),
            _buildDetailRow('Due Date', invoice['dueDate']),
            _buildDetailRow('Currency', invoice['currency']),
            const SizedBox(height: 16),
            const Text(
              'Items:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            ...invoice['items'].map<Widget>((item) => _buildItemRow(item)),
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
        if (invoice['type'] == 'Quote')
          ElevatedButton(
            onPressed: () {
              // Handle convert to invoice
              Navigator.of(context).pop();
            },
            child: const Text('Convert to Invoice'),
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

  Widget _buildItemRow(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              item['description'],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              'Qty: ${item['quantity']}',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              '\$${item['rate'].toStringAsFixed(2)}',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              '\$${item['amount'].toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
