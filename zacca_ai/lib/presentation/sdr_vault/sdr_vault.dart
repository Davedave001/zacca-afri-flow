import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import './widgets/advanced_filter_panel.dart';
import './widgets/context_menu_widget.dart';
import './widgets/export_options_sheet.dart';
import './widgets/grouped_transaction_list.dart';
import './widgets/search_bar_widget.dart';
import './widgets/vault_summary_cards.dart';

class SdrVault extends StatefulWidget {
  const SdrVault({super.key});

  @override
  State<SdrVault> createState() => _SdrVaultState();
}

class _SdrVaultState extends State<SdrVault> with TickerProviderStateMixin {
  bool _isFilterExpanded = false;
  bool _isSearchVisible = false;
  bool _isMultiSelectMode = false;
  String _searchQuery = '';
  final Set<int> _selectedTransactions = {};
  OverlayEntry? _contextMenuOverlay;

  // Mock transaction data
  final List<Map<String, dynamic>> _allTransactions = [
    {
      "id": 1,
      "description": "M-Pesa payment from John Mwangi",
      "amount": 15000,
      "type": "income",
      "date": "03 Sep 2025",
      "monthKey": "2025-09",
      "contact": "John Mwangi",
      "isVerified": true,
      "blockchainHash": "0x1a2b3c4d5e6f",
    },
    {
      "id": 2,
      "description": "Office supplies purchase",
      "amount": 3500,
      "type": "expense",
      "date": "02 Sep 2025",
      "monthKey": "2025-09",
      "contact": "Nakumatt Supermarket",
      "isVerified": true,
      "blockchainHash": "0x2b3c4d5e6f7g",
    },
    {
      "id": 3,
      "description": "Client payment - Website development",
      "amount": 45000,
      "type": "income",
      "date": "01 Sep 2025",
      "monthKey": "2025-09",
      "contact": "Sarah Wanjiku",
      "isVerified": true,
      "blockchainHash": "0x3c4d5e6f7g8h",
    },
    {
      "id": 4,
      "description": "Fuel expenses",
      "amount": 2800,
      "type": "expense",
      "date": "30 Aug 2025",
      "monthKey": "2025-08",
      "contact": "Shell Petrol Station",
      "isVerified": false,
      "blockchainHash": null,
    },
    {
      "id": 5,
      "description": "Consulting fee from Peter Kamau",
      "amount": 25000,
      "type": "income",
      "date": "28 Aug 2025",
      "monthKey": "2025-08",
      "contact": "Peter Kamau",
      "isVerified": true,
      "blockchainHash": "0x4d5e6f7g8h9i",
    },
    {
      "id": 6,
      "description": "Internet bill payment",
      "amount": 4500,
      "type": "expense",
      "date": "25 Aug 2025",
      "monthKey": "2025-08",
      "contact": "Safaricom",
      "isVerified": true,
      "blockchainHash": "0x5e6f7g8h9i0j",
    },
    {
      "id": 7,
      "description": "Product sales - Grace Akinyi",
      "amount": 8500,
      "type": "income",
      "date": "22 Aug 2025",
      "monthKey": "2025-08",
      "contact": "Grace Akinyi",
      "isVerified": true,
      "blockchainHash": "0x6f7g8h9i0j1k",
    },
    {
      "id": 8,
      "description": "Marketing expenses",
      "amount": 12000,
      "type": "expense",
      "date": "20 Aug 2025",
      "monthKey": "2025-08",
      "contact": "Facebook Ads",
      "isVerified": false,
      "blockchainHash": null,
    },
  ];

  List<Map<String, dynamic>> get _filteredTransactions {
    if (_searchQuery.isEmpty) {
      return _allTransactions;
    }

    return _allTransactions.where((transaction) {
      final description = (transaction["description"] ?? "").toLowerCase();
      final contact = (transaction["contact"] ?? "").toLowerCase();
      final amount = transaction["amount"].toString();
      final query = _searchQuery.toLowerCase();

      return description.contains(query) ||
          contact.contains(query) ||
          amount.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: 'SDR Vault',
        variant: CustomAppBarVariant.standard,
        actions: [
          IconButton(
            onPressed: _toggleSearch,
            icon: CustomIconWidget(
              iconName: 'search',
              color: colorScheme.onSurface,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: _showExportOptions,
            icon: CustomIconWidget(
              iconName: 'file_download',
              color: colorScheme.onSurface,
              size: 24,
            ),
          ),
          if (_isMultiSelectMode)
            IconButton(
              onPressed: _exitMultiSelectMode,
              icon: CustomIconWidget(
                iconName: 'close',
                color: colorScheme.onSurface,
                size: 24,
              ),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Column(
          children: [
            // Summary Cards
            VaultSummaryCards(),
            SizedBox(height: 2.h),
            // Search Bar (Collapsible)
            if (_isSearchVisible)
              SearchBarWidget(
                isVisible: _isSearchVisible,
                onSearchChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
                onSearchTap: () {
                  // Handle search tap if needed
                },
              ),
            // Advanced Filter Panel
            AdvancedFilterPanel(
              isExpanded: _isFilterExpanded,
              onToggle: () {
                setState(() {
                  _isFilterExpanded = !_isFilterExpanded;
                });
              },
            ),
            SizedBox(height: 2.h),
            // Multi-select toolbar
            if (_isMultiSelectMode)
              _buildMultiSelectToolbar(theme, colorScheme),
            // Transaction List
            Expanded(
              child: GroupedTransactionList(
                transactions: _filteredTransactions,
                onTransactionTap: _handleTransactionTap,
                onTransactionLongPress: _handleTransactionLongPress,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 3, // SDR Vault tab
        variant: CustomBottomBarVariant.standard,
        onTap: (index) {
          // Navigation handled by CustomBottomBar
        },
      ),
      floatingActionButton: _isMultiSelectMode
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/whats-app-import-screen');
              },
              child: CustomIconWidget(
                iconName: 'add',
                color: colorScheme.onPrimary,
                size: 24,
              ),
            ),
    );
  }

  Widget _buildMultiSelectToolbar(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_selectedTransactions.length} selected',
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: _bulkExport,
                icon: CustomIconWidget(
                  iconName: 'file_download',
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: _bulkCategorize,
                icon: CustomIconWidget(
                  iconName: 'label',
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: _bulkArchive,
                icon: CustomIconWidget(
                  iconName: 'archive',
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSearch() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchQuery = '';
      }
    });
  }

  void _handleTransactionTap(Map<String, dynamic> transaction) {
    if (_isMultiSelectMode) {
      setState(() {
        final id = transaction["id"] as int;
        if (_selectedTransactions.contains(id)) {
          _selectedTransactions.remove(id);
        } else {
          _selectedTransactions.add(id);
        }

        if (_selectedTransactions.isEmpty) {
          _isMultiSelectMode = false;
        }
      });
    } else {
      _showTransactionDetails(transaction);
    }
  }

  void _handleTransactionLongPress(Map<String, dynamic> transaction) {
    if (!_isMultiSelectMode) {
      _showContextMenu(transaction);
    }
  }

  void _showContextMenu(Map<String, dynamic> transaction) {
    _removeContextMenu();
    _contextMenuOverlay = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _removeContextMenu,
        child: Container(
          color: Colors.black.withValues(alpha: 0.3),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: ContextMenuWidget(
                transaction: transaction,
                onViewDetails: () => _showTransactionDetails(transaction),
                onExportPdf: () => _exportTransactionPdf(transaction),
                onShare: () => _shareTransaction(transaction),
                onArchive: () => _archiveTransaction(transaction),
                onClose: _removeContextMenu,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_contextMenuOverlay!);
  }

  void _removeContextMenu() {
    _contextMenuOverlay?.remove();
    _contextMenuOverlay = null;
  }

  void _showExportOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ExportOptionsSheet(
        onExportPdf: _exportAllPdf,
        onExportCsv: _exportAllCsv,
        onExportBlockchain: _exportBlockchainVerification,
        onBulkExport: _showBulkExportOptions,
      ),
    );
  }

  void _showTransactionDetails(Map<String, dynamic> transaction) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildTransactionDetailsSheet(transaction),
    );
  }

  Widget _buildTransactionDetailsSheet(Map<String, dynamic> transaction) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final amount = (transaction["amount"] as num?)?.toDouble() ?? 0.0;
    final isIncome =
        (transaction["type"] ?? "expense").toLowerCase() == "income";
    final isVerified = transaction["isVerified"] ?? false;

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle Bar
          Center(
            child: Container(
              width: 12.w,
              height: 0.5.h,
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          // Transaction Header
          Row(
            children: [
              Container(
                width: 15.w,
                height: 15.w,
                decoration: BoxDecoration(
                  color: isIncome
                      ? colorScheme.tertiary.withValues(alpha: 0.1)
                      : colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: CustomIconWidget(
                  iconName: isIncome ? 'trending_up' : 'trending_down',
                  color: isIncome ? colorScheme.tertiary : colorScheme.error,
                  size: 30,
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction["description"] ?? "Transaction",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '${isIncome ? '+' : '-'}KES ${amount.toStringAsFixed(0)}',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color:
                            isIncome ? colorScheme.tertiary : colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          // Transaction Details
          _buildDetailRow(
              'Date', transaction["date"] ?? "Unknown", theme, colorScheme),
          _buildDetailRow('Contact', transaction["contact"] ?? "Unknown", theme,
              colorScheme),
          _buildDetailRow(
              'Type', transaction["type"] ?? "Unknown", theme, colorScheme),
          _buildDetailRow(
            'Status',
            isVerified ? 'Verified' : 'Pending Verification',
            theme,
            colorScheme,
            valueColor: isVerified ? colorScheme.tertiary : colorScheme.error,
          ),
          if (transaction["blockchainHash"] != null)
            _buildDetailRow(
              'Blockchain Hash',
              transaction["blockchainHash"],
              theme,
              colorScheme,
              isMonospace: true,
            ),
          SizedBox(height: 4.h),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _shareTransaction(transaction);
                  },
                  icon: CustomIconWidget(
                    iconName: 'share',
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  label: Text('Share'),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _exportTransactionPdf(transaction);
                  },
                  icon: CustomIconWidget(
                    iconName: 'picture_as_pdf',
                    color: colorScheme.onPrimary,
                    size: 20,
                  ),
                  label: Text('Export PDF'),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    ThemeData theme,
    ColorScheme colorScheme, {
    Color? valueColor,
    bool isMonospace = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: isMonospace
                  ? AppTheme.getMonospaceStyle(
                      isLight: theme.brightness == Brightness.light,
                      fontSize: 12,
                    )
                  : theme.textTheme.bodyMedium?.copyWith(
                      color: valueColor ?? colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
            ),
          ),
        ],
      ),
    );
  }


  void _exitMultiSelectMode() {
    setState(() {
      _isMultiSelectMode = false;
      _selectedTransactions.clear();
    });
  }

  Future<void> _refreshData() async {
    // Simulate data refresh
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // Refresh logic here
    });
  }

  void _exportTransactionPdf(Map<String, dynamic> transaction) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Exporting transaction PDF...'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () {},
        ),
      ),
    );
  }

  void _shareTransaction(Map<String, dynamic> transaction) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sharing transaction...')),
    );
  }

  void _archiveTransaction(Map<String, dynamic> transaction) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction archived'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ),
    );
  }

  void _exportAllPdf() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Exporting all transactions as PDF...')),
    );
  }

  void _exportAllCsv() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Exporting all transactions as CSV...')),
    );
  }

  void _exportBlockchainVerification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Generating blockchain verification file...')),
    );
  }

  void _showBulkExportOptions() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening bulk export options...')),
    );
  }

  void _bulkExport() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Exporting ${_selectedTransactions.length} transactions...')),
    );
  }

  void _bulkCategorize() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Categorizing ${_selectedTransactions.length} transactions...')),
    );
  }

  void _bulkArchive() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Archiving ${_selectedTransactions.length} transactions...')),
    );
  }
}
