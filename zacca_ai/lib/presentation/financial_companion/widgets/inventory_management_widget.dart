import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class InventoryManagementWidget extends StatefulWidget {
  const InventoryManagementWidget({Key? key}) : super(key: key);

  @override
  State<InventoryManagementWidget> createState() => _InventoryManagementWidgetState();
}

class _InventoryManagementWidgetState extends State<InventoryManagementWidget> {
  final List<Map<String, dynamic>> _inventory = [
    {
      'id': 'INV-001',
      'name': 'Laptop Dell XPS 13',
      'category': 'Electronics',
      'sku': 'LAP-DELL-XPS13',
      'quantity': 15,
      'minQuantity': 5,
      'cost': 899.99,
      'price': 1299.99,
      'supplier': 'Tech Supplies Co.',
      'location': 'Warehouse A',
      'lastUpdated': '2024-03-10',
      'status': 'In Stock',
    },
    {
      'id': 'INV-002',
      'name': 'Office Chair Ergonomic',
      'category': 'Furniture',
      'sku': 'FUR-CHAIR-ERG01',
      'quantity': 8,
      'minQuantity': 3,
      'cost': 199.99,
      'price': 299.99,
      'supplier': 'Office Furniture Ltd.',
      'location': 'Warehouse B',
      'lastUpdated': '2024-03-08',
      'status': 'Low Stock',
    },
    {
      'id': 'INV-003',
      'name': 'Wireless Mouse Logitech',
      'category': 'Electronics',
      'sku': 'ELEC-MOUSE-LOG01',
      'quantity': 0,
      'minQuantity': 10,
      'cost': 24.99,
      'price': 39.99,
      'supplier': 'Tech Supplies Co.',
      'location': 'Warehouse A',
      'lastUpdated': '2024-03-05',
      'status': 'Out of Stock',
    },
    {
      'id': 'INV-004',
      'name': 'Desk Lamp LED',
      'category': 'Lighting',
      'sku': 'LIGHT-LAMP-LED01',
      'quantity': 25,
      'minQuantity': 8,
      'cost': 45.99,
      'price': 79.99,
      'supplier': 'Lighting Solutions',
      'location': 'Warehouse C',
      'lastUpdated': '2024-03-12',
      'status': 'In Stock',
    },
  ];

  final List<String> _categories = [
    'Electronics',
    'Furniture',
    'Lighting',
    'Office Supplies',
    'Software',
    'Hardware',
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
          // Action Buttons
          _buildActionButtons(),
          
          const SizedBox(height: 20),
          
          // Filters
          _buildFilters(),
          
          const SizedBox(height: 20),
          
          // Inventory Summary
          _buildInventorySummary(),
          
          const SizedBox(height: 20),
          
          // Inventory List
          _buildInventoryList(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showAddItemDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Add Item'),
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
            onPressed: () => _showStockAdjustmentDialog(),
            icon: const Icon(Icons.inventory),
            label: const Text('Stock Adjustment'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
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
            ['All', ..._categories],
            (value) => setState(() => _selectedCategory = value!),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFilterDropdown(
            'Status',
            _selectedStatus,
            ['All', 'In Stock', 'Low Stock', 'Out of Stock'],
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

  Widget _buildInventorySummary() {
    final totalItems = _inventory.length;
    final totalValue = _inventory.fold<double>(
      0, (sum, item) => sum + (item['quantity'] * item['cost']));
    final lowStockItems = _inventory.where((item) => item['status'] == 'Low Stock').length;
    final outOfStockItems = _inventory.where((item) => item['status'] == 'Out of Stock').length;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Total Items',
                totalItems.toString(),
                Colors.blue[50]!,
                Colors.blue,
                Icons.inventory,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Total Value',
                '\$${totalValue.toStringAsFixed(2)}',
                Colors.green[50]!,
                Colors.green,
                Icons.account_balance_wallet,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Low Stock',
                lowStockItems.toString(),
                Colors.orange[50]!,
                Colors.orange,
                Icons.warning,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Out of Stock',
                outOfStockItems.toString(),
                Colors.red[50]!,
                Colors.red,
                Icons.error,
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

  Widget _buildInventoryList() {
    final filteredInventory = _inventory.where((item) {
      final categoryMatch = _selectedCategory == 'All' || 
                           item['category'] == _selectedCategory;
      final statusMatch = _selectedStatus == 'All' || 
                         item['status'] == _selectedStatus;
      return categoryMatch && statusMatch;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Inventory Items (${filteredInventory.length})',
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
          itemCount: filteredInventory.length,
          itemBuilder: (context, index) {
            final item = filteredInventory[index];
            return _buildInventoryCard(item);
          },
        ),
      ],
    );
  }

  Widget _buildInventoryCard(Map<String, dynamic> item) {
    final statusColor = _getStatusColor(item['status']);
    final isLowStock = item['quantity'] <= item['minQuantity'];
    
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
            color: _getCategoryColor(item['category']).withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCategoryIcon(item['category']),
            color: _getCategoryColor(item['category']),
            size: 24,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                item['name'],
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
                item['status'],
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
              'SKU: ${item['sku']} • ${item['category']}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Qty: ${item['quantity']}',
                  style: TextStyle(
                    color: isLowStock ? Colors.orange : Colors.grey[600],
                    fontSize: 12,
                    fontWeight: isLowStock ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Min: ${item['minQuantity']}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Location: ${item['location']}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Supplier: ${item['supplier']}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${item['price'].toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            Text(
              'Cost: \$${item['cost'].toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 11,
              ),
            ),
            Text(
              'Updated: ${item['lastUpdated']}',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 10,
              ),
            ),
          ],
        ),
        onTap: () => _showItemDetails(item),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'In Stock':
        return Colors.green;
      case 'Low Stock':
        return Colors.orange;
      case 'Out of Stock':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Electronics':
        return Colors.blue;
      case 'Furniture':
        return Colors.brown;
      case 'Lighting':
        return Colors.yellow[700]!;
      case 'Office Supplies':
        return Colors.green;
      case 'Software':
        return Colors.purple;
      case 'Hardware':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Electronics':
        return Icons.devices;
      case 'Furniture':
        return Icons.chair;
      case 'Lighting':
        return Icons.lightbulb;
      case 'Office Supplies':
        return Icons.work;
      case 'Software':
        return Icons.computer;
      case 'Hardware':
        return Icons.build;
      default:
        return Icons.category;
    }
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddItemDialog(),
    );
  }

  void _showStockAdjustmentDialog() {
    showDialog(
      context: context,
      builder: (context) => const StockAdjustmentDialog(),
    );
  }

  void _showItemDetails(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => ItemDetailsDialog(item: item),
    );
  }
}

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _skuController = TextEditingController();
  final _quantityController = TextEditingController();
  final _minQuantityController = TextEditingController();
  final _costController = TextEditingController();
  final _priceController = TextEditingController();
  final _supplierController = TextEditingController();
  final _locationController = TextEditingController();
  String _selectedCategory = 'Electronics';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Item'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _skuController,
                      decoration: const InputDecoration(
                        labelText: 'SKU',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter SKU';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Electronics', 'Furniture', 'Lighting', 'Office Supplies', 'Software', 'Hardware', 'Other']
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
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter quantity';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid quantity';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _minQuantityController,
                      decoration: const InputDecoration(
                        labelText: 'Min Quantity',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter min quantity';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid quantity';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _costController,
                      decoration: const InputDecoration(
                        labelText: 'Cost',
                        border: OutlineInputBorder(),
                        prefixText: '\$',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter cost';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid cost';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                        prefixText: '\$',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _supplierController,
                      decoration: const InputDecoration(
                        labelText: 'Supplier',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter supplier';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
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
              // Handle item creation
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add Item'),
        ),
      ],
    );
  }
}

class StockAdjustmentDialog extends StatefulWidget {
  const StockAdjustmentDialog({Key? key}) : super(key: key);

  @override
  State<StockAdjustmentDialog> createState() => _StockAdjustmentDialogState();
}

class _StockAdjustmentDialogState extends State<StockAdjustmentDialog> {
  final _formKey = GlobalKey<FormState>();
  String _selectedItem = '';
  String _adjustmentType = 'Add';
  final _quantityController = TextEditingController();
  final _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Stock Adjustment'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              initialValue: _selectedItem.isEmpty ? null : _selectedItem,
              decoration: const InputDecoration(
                labelText: 'Select Item',
                border: OutlineInputBorder(),
              ),
              items: ['Laptop Dell XPS 13', 'Office Chair Ergonomic', 'Wireless Mouse Logitech', 'Desk Lamp LED']
                  .map<DropdownMenuItem<String>>((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an item';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _adjustmentType,
                    decoration: const InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Add', 'Remove']
                        .map<DropdownMenuItem<String>>((type) => DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _adjustmentType = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter quantity';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid quantity';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reasonController,
              decoration: const InputDecoration(
                labelText: 'Reason',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a reason';
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
              // Handle stock adjustment
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adjust Stock'),
        ),
      ],
    );
  }
}

class ItemDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> item;

  const ItemDetailsDialog({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(item['name']),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('SKU', item['sku']),
            _buildDetailRow('Category', item['category']),
            _buildDetailRow('Quantity', item['quantity'].toString()),
            _buildDetailRow('Min Quantity', item['minQuantity'].toString()),
            _buildDetailRow('Cost', '\$${item['cost'].toStringAsFixed(2)}'),
            _buildDetailRow('Price', '\$${item['price'].toStringAsFixed(2)}'),
            _buildDetailRow('Supplier', item['supplier']),
            _buildDetailRow('Location', item['location']),
            _buildDetailRow('Status', item['status']),
            _buildDetailRow('Last Updated', item['lastUpdated']),
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
}
