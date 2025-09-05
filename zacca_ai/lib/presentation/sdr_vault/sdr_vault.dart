import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../models/sdr_model.dart';
import '../../data/sample_data.dart';
import './widgets/advanced_filter_panel.dart';
import './widgets/context_menu_widget.dart';
import './widgets/export_options_sheet.dart';
import './widgets/search_bar_widget.dart';
import './widgets/vault_summary_cards.dart';
import './widgets/confirmed_sdr_card.dart';
import './widgets/sales_chart_widget.dart';

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
  
  // Verified VBRs data
  List<VBRModel> _verifiedVBRs = SampleData.verifiedVBRs;

  // Mock transaction data removed - using VBRs instead


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
        child: SingleChildScrollView(
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
                          // Sales Chart
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SalesChartWidget(confirmedSDRs: _verifiedVBRs.map((vbr) => SDRModel(
                id: vbr.id,
                buyer: vbr.buyer,
                seller: vbr.seller,
                product: vbr.product,
                quantity: 1,
                amount: vbr.amount,
                status: vbr.status,
                date: vbr.verifiedAt,
                chatRef: vbr.chatRef,
                maskedPhone: vbr.maskedPhone,
              )).toList()),
            ),
              SizedBox(height: 2.h),
              
              // Verified VBRs List Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Verified Business Records',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${_verifiedVBRs.length} records',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              
              // Verified VBRs List
              _buildVerifiedVBRsList(),
              
              // Bottom spacing for navigation
              SizedBox(height: 10.h),
            ],
          ),
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

  Widget _buildVerifiedVBRsList() {
    final filteredVBRs = _getFilteredVerifiedVBRs();

    if (filteredVBRs.isEmpty) {
      return Container(
        height: 30.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified,
                size: 20.w,
                color: Colors.grey[400],
              ),
              SizedBox(height: 2.h),
              Text(
                'No verified records found',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Verify SDRs in the Draft page to see them here',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: filteredVBRs.map((vbr) {
        final isSelected = _selectedTransactions.contains(int.parse(vbr.id));

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ConfirmedSDRCard(
            sdr: SDRModel(
              id: vbr.id,
              buyer: vbr.buyer,
              seller: vbr.seller,
              product: vbr.product,
              quantity: 1,
              amount: vbr.amount,
              status: vbr.status,
              date: vbr.verifiedAt,
              chatRef: vbr.chatRef,
              maskedPhone: vbr.maskedPhone,
              verified: true,
              blockchainHash: vbr.hash,
            ),
            isSelected: _isMultiSelectMode && isSelected,
            onDownloadPDF: () => _downloadPDF(vbr),
            onShare: () => _shareVBR(vbr),
            onLongPress: _isMultiSelectMode
                ? null
                : () {
                    _toggleMultiSelectMode();
                    _toggleTransactionSelection(int.parse(vbr.id));
                  },
          ),
        );
      }).toList(),
    );
  }

  List<VBRModel> _getFilteredVerifiedVBRs() {
    List<VBRModel> filtered = _verifiedVBRs;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((vbr) {
        return vbr.buyer.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               vbr.id.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               vbr.product.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  void _downloadPDF(VBRModel vbr) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading PDF for VBR #${vbr.id}...'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareVBR(VBRModel vbr) {
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
            Text(
              'Share VBR #${vbr.id}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareOption(
                  context,
                  'WhatsApp',
                  Icons.chat,
                  Color(0xFF25D366),
                  () => _shareToWhatsApp(vbr),
                ),
                _buildShareOption(
                  context,
                  'Email',
                  Icons.email,
                  Color(0xFFEA4335),
                  () => _shareToEmail(vbr),
                ),
                _buildShareOption(
                  context,
                  'Copy Link',
                  Icons.link,
                  Color(0xFF08F5F8),
                  () => _copyLink(vbr),
                ),
              ],
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 8.w),
            SizedBox(height: 1.h),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareToWhatsApp(VBRModel vbr) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sharing VBR #${vbr.id} to WhatsApp...'),
        backgroundColor: Color(0xFF25D366),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareToEmail(VBRModel vbr) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sharing VBR #${vbr.id} via Email...'),
        backgroundColor: Color(0xFFEA4335),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _copyLink(VBRModel vbr) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Link for VBR #${vbr.id} copied to clipboard'),
        backgroundColor: Color(0xFF08F5F8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _toggleMultiSelectMode() {
    setState(() {
      _isMultiSelectMode = !_isMultiSelectMode;
      if (!_isMultiSelectMode) {
        _selectedTransactions.clear();
      }
    });
  }

  void _toggleTransactionSelection(int transactionId) {
    setState(() {
      if (_selectedTransactions.contains(transactionId)) {
        _selectedTransactions.remove(transactionId);
      } else {
        _selectedTransactions.add(transactionId);
      }
    });
  }
}
