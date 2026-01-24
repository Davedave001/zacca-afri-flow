import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../models/sdr_model.dart';
import '../../data/sample_data.dart';
import './widgets/advanced_filter_panel.dart';
import './widgets/export_options_sheet.dart';
import './widgets/search_bar_widget.dart';
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
        actions: [
          IconButton(
            onPressed: _toggleSearch,
            icon: Icon(
              _isSearchVisible ? Icons.close : Icons.search,
              color: colorScheme.onSurface,
            ),
          ),
          IconButton(
            onPressed: _toggleFilter,
            icon: Icon(
              _isFilterExpanded ? Icons.filter_list_off : Icons.filter_list,
              color: colorScheme.onSurface,
            ),
          ),
          if (_isMultiSelectMode)
            IconButton(
              onPressed: _toggleMultiSelectMode,
              icon: Icon(Icons.close, color: colorScheme.onSurface),
            )
          else
            IconButton(
              onPressed: _toggleMultiSelectMode,
              icon: Icon(Icons.checklist, color: colorScheme.onSurface),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            if (_isSearchVisible)
              Container(
                padding: EdgeInsets.all(4.w),
                child: SearchBarWidget(
                  onSearchChanged: (query) {
                    setState(() => _searchQuery = query);
                  },
                ),
              ),

            // Filter Panel
            if (_isFilterExpanded)
              AdvancedFilterPanel(
                isExpanded: _isFilterExpanded,
                onToggle: _toggleFilter,
              ),

            // Multi-select Toolbar
            if (_isMultiSelectMode && _selectedTransactions.isNotEmpty)
              _buildMultiSelectToolbar(theme, colorScheme),

            // Sales Chart
            Padding(
              padding: EdgeInsets.all(4.w),
              child: SalesChartWidget(
                confirmedSDRs: _verifiedVBRs.map((vbr) => SDRModel(
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
                  notes: 'Verified VBR',
                )).toList(),
              ),
            ),

            // Verified SDR Records Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Text(
                    'Verified Business Records',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${_getFilteredVerifiedVBRs().length} records',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 2.h),

            // Verified VBRs List
            _buildVerifiedVBRsList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showExportOptions,
        child: Icon(Icons.download, color: Colors.white),
        backgroundColor: theme.brightness == Brightness.light ? AppTheme.primaryLight : AppTheme.primaryDark,
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.smartDraftInbox);
          }
        },
      ),
    );
  }

  Widget _buildMultiSelectToolbar(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            '${_selectedTransactions.length} selected',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: _bulkExport,
            icon: Icon(Icons.download),
            tooltip: 'Export Selected',
          ),
          IconButton(
            onPressed: _bulkCategorize,
            icon: Icon(Icons.category),
            tooltip: 'Categorize',
          ),
          IconButton(
            onPressed: _bulkArchive,
            icon: Icon(Icons.archive),
            tooltip: 'Archive',
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

  void _toggleFilter() {
    setState(() {
      _isFilterExpanded = !_isFilterExpanded;
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

  void _toggleMultiSelectMode() {
    setState(() {
      _isMultiSelectMode = !_isMultiSelectMode;
      if (!_isMultiSelectMode) {
        _selectedTransactions.clear();
      }
    });
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
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 20.w,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            SizedBox(height: 4.h),
            Text(
              'No verified records found',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              'Verified SDRs will appear here once they are confirmed',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
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
              notes: 'Verified VBR',
            ),
            isSelected: isSelected,
            onLongPress: () => _toggleTransactionSelection(int.parse(vbr.id)),
            onDownloadPDF: () => _downloadPDF(vbr),
            onShare: () => _shareVBR(vbr),
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
               vbr.product.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               vbr.id.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  void _downloadPDF(VBRModel vbr) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading PDF for VBR #${vbr.id}...'),
        backgroundColor: AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareVBR(VBRModel vbr) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12.w,
              height: 0.5.h,
              margin: EdgeInsets.symmetric(vertical: 1.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Text(
                    'Share VBR #${vbr.id}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  _buildShareOption(
                    icon: Icons.chat,
                    title: 'WhatsApp',
                    subtitle: 'Share via WhatsApp',
                    onTap: () => _shareToWhatsApp(vbr),
                  ),
                  _buildShareOption(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: 'Send via Email',
                    onTap: () => _shareToEmail(vbr),
                  ),
                  _buildShareOption(
                    icon: Icons.link,
                    title: 'Copy Link',
                    subtitle: 'Copy shareable link',
                    onTap: () => _copyLink(vbr),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  void _shareToWhatsApp(VBRModel vbr) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening WhatsApp to share VBR #${vbr.id}...'),
        backgroundColor: AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareToEmail(VBRModel vbr) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening email client to share VBR #${vbr.id}...'),
        backgroundColor: AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _copyLink(VBRModel vbr) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Link copied to clipboard'),
        backgroundColor: AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
