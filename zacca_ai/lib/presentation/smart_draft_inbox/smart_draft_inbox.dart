import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../models/sdr_model.dart';
import '../../data/sample_data.dart';
import '../../services/verification_service.dart';
import './widgets/bulk_action_bar_widget.dart';
import './widgets/empty_state_widget.dart';
import './widgets/filter_chips_widget.dart';
import './widgets/search_bar_widget.dart';
import './widgets/sdr_card_widget.dart';
import './widgets/verification_dialog.dart';
import './widgets/upload_screenshot_modal.dart';
import './widgets/sms_selection_modal.dart';

class SmartDraftInbox extends StatefulWidget {
  const SmartDraftInbox({super.key});

  @override
  State<SmartDraftInbox> createState() => _SmartDraftInboxState();
}

class _SmartDraftInboxState extends State<SmartDraftInbox>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  // State variables
  String _selectedFilter = 'All';
  bool _isSearchExpanded = false;
  String _searchQuery = '';
  bool _isBulkSelectionMode = false;
  Set<String> _selectedTransactionIds = {};
  bool _isLoading = false;

  // SDR data
  List<SDRModel> _draftSDRs = SampleData.draftSDRs;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadTransactions() async {
    setState(() => _isLoading = true);

    // Simulate loading delay
    await Future.delayed(Duration(seconds: 1));

    setState(() => _isLoading = false);
  }

  Future<void> _refreshTransactions() async {
    HapticFeedback.lightImpact();
    await _loadTransactions();
  }

  List<SDRModel> get _filteredSDRs {
    List<SDRModel> filtered = _draftSDRs;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((sdr) {
        return sdr.product.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               sdr.buyer.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               sdr.maskedPhone?.contains(_searchQuery) ?? false;
      }).toList();
    }

    // Apply status filter
    if (_selectedFilter != 'All') {
      filtered = filtered.where((sdr) => sdr.status == _selectedFilter).toList();
    }

    return filtered;
  }

  Map<String, int> get _filterCounts {
    return {
      'All': _draftSDRs.length,
      'Pending Verification': _draftSDRs.where((sdr) => sdr.status == 'Pending Verification').length,
      'Partial Payment': _draftSDRs.where((sdr) => sdr.status == 'Partial Payment').length,
      'Paid': _draftSDRs.where((sdr) => sdr.status == 'Paid').length,
    };
  }

  void _toggleBulkSelection() {
    setState(() {
      _isBulkSelectionMode = !_isBulkSelectionMode;
      if (!_isBulkSelectionMode) {
        _selectedTransactionIds.clear();
      }
    });
  }

  void _toggleTransactionSelection(String transactionId) {
    setState(() {
      if (_selectedTransactionIds.contains(transactionId)) {
        _selectedTransactionIds.remove(transactionId);
      } else {
        _selectedTransactionIds.add(transactionId);
      }
    });
  }

  void _approveTransaction(String transactionId) {
    setState(() {
      _draftSDRs.removeWhere((sdr) => sdr.id == transactionId);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction approved successfully'),
        backgroundColor: AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _rejectTransaction(String transactionId) {
    setState(() {
      _draftSDRs.removeWhere((sdr) => sdr.id == transactionId);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction rejected'),
        backgroundColor: AppTheme.getErrorColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _bulkApprove() {
    setState(() {
      _draftSDRs.removeWhere((sdr) => _selectedTransactionIds.contains(sdr.id));
      _selectedTransactionIds.clear();
      _isBulkSelectionMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_selectedTransactionIds.length} transactions approved'),
        backgroundColor: AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _bulkReject() {
    setState(() {
      _draftSDRs.removeWhere((sdr) => _selectedTransactionIds.contains(sdr.id));
      _selectedTransactionIds.clear();
      _isBulkSelectionMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_selectedTransactionIds.length} transactions rejected'),
        backgroundColor: AppTheme.getErrorColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _bulkDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Transactions'),
        content: Text('Are you sure you want to delete ${_selectedTransactionIds.length} transactions? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _draftSDRs.removeWhere((sdr) => _selectedTransactionIds.contains(sdr.id));
                _selectedTransactionIds.clear();
                _isBulkSelectionMode = false;
              });
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Transactions deleted successfully'),
                  backgroundColor: AppTheme.getErrorColor(Theme.of(context).brightness == Brightness.light),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Text('Delete'),
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
      backgroundColor: colorScheme.background,
      appBar: CustomAppBar(
        title: 'Smart Draft Inbox',
        actions: [
          if (_isBulkSelectionMode)
            IconButton(
              onPressed: _toggleBulkSelection,
              icon: Icon(Icons.close, color: colorScheme.onBackground),
            )
          else
            IconButton(
              onPressed: _toggleBulkSelection,
              icon: Icon(Icons.checklist, color: colorScheme.onBackground),
            ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
          SearchBarWidget(
            isExpanded: _isSearchExpanded,
                  onToggle: () => setState(() => _isSearchExpanded = !_isSearchExpanded),
            onChanged: _onSearchChanged,
          ),
                SizedBox(height: 2.h),
          FilterChipsWidget(
                  filters: ['All', 'Pending Verification', 'Partial Payment', 'Paid'],
            selectedFilter: _selectedFilter,
                  filterCounts: _filterCounts,
            onFilterChanged: _onFilterChanged,
          ),
        ],
      ),
          ),

          // Bulk Action Bar
          if (_isBulkSelectionMode && _selectedTransactionIds.isNotEmpty)
          BulkActionBarWidget(
            selectedCount: _selectedTransactionIds.length,
            onApproveAll: _bulkApprove,
            onRejectAll: _bulkReject,
            onDeleteAll: _bulkDelete,
            ),

          // Content
          Expanded(
            child: _isLoading
                ? _buildLoadingState()
                : _filteredSDRs.isEmpty
                    ? _buildEmptyState()
                    : _buildSDRList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _importWhatsAppChat,
        icon: Icon(Icons.upload_file, color: Colors.white),
        label: Text('Import WhatsApp Chat'),
        backgroundColor: theme.brightness == Brightness.light ? AppTheme.primaryLight : AppTheme.primaryDark,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.sdrVault);
          }
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => _buildSkeletonCard(),
    );
  }

  Widget _buildSkeletonCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2.h,
            width: 30.w,
            color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      height: 1.5.h,
            width: 60.w,
            color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    height: 1.5.h,
            width: 40.w,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget(
      title: 'No Draft SDRs Found',
      subtitle: 'Import WhatsApp chats to start creating Smart Draft Records',
      buttonText: 'Import Chat',
      illustrationUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=300&fit=crop&crop=center',
    );
  }

  Widget _buildSDRList() {
    return RefreshIndicator(
      onRefresh: _refreshTransactions,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        itemCount: _filteredSDRs.length,
        itemBuilder: (context, index) {
          final sdr = _filteredSDRs[index];
          return SDRCardWidget(
            sdr: sdr,
            isSelected: _selectedTransactionIds.contains(sdr.id),
            onLongPress: () => _toggleTransactionSelection(sdr.id),
            onUploadScreenshot: () => _uploadScreenshot(sdr),
            onPasteCode: () => _pasteCode(sdr),
            onSelectSMS: () => _selectSMS(sdr),
            onDelete: () => _deleteSDR(sdr),
          );
        },
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 1.h),
        ...children,
        SizedBox(height: 2.h),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(double score) {
    if (score >= 0.8) {
      return AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light);
    } else if (score >= 0.6) {
      return AppTheme.getWarningColor(Theme.of(context).brightness == Brightness.light);
    } else {
      return AppTheme.getErrorColor(Theme.of(context).brightness == Brightness.light);
    }
  }

  // SDR Methods
  void _onSearchChanged(String query) {
    setState(() => _searchQuery = query);
  }

  void _onFilterChanged(String filter) {
    setState(() => _selectedFilter = filter);
  }

  void _importWhatsAppChat() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        setState(() => _isLoading = true);
        
        // Simulate processing delay
        await Future.delayed(Duration(seconds: 2));
        
        // Create a new SDR from the imported chat
        final newSDR = SDRModel(
          id: 'SDR_${DateTime.now().millisecondsSinceEpoch}',
          buyer: 'Imported Customer',
          seller: 'Your Business',
          product: 'Imported Product',
          quantity: 1,
          amount: 1000.0,
          status: 'Pending Verification',
          date: DateTime.now(),
          chatRef: 'WhatsApp Chat Import',
          maskedPhone: '254***123456',
          notes: 'Imported from WhatsApp chat file',
        );
        
        setState(() {
          _draftSDRs.insert(0, newSDR);
          _isLoading = false;
        });
        
        _showSuccessSnackBar('WhatsApp chat imported successfully!');
      }
    } catch (e) {
      _showErrorSnackBar('Failed to import WhatsApp chat: $e');
    }
  }

  void _uploadScreenshot(SDRModel sdr) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => UploadScreenshotModal(
        sdr: sdr,
        onUpload: (filePath) => _processVerification(sdr, 'Screenshot', filePath),
      ),
    );
  }

  void _pasteCode(SDRModel sdr) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => VerificationDialog(
        sdr: sdr,
        onVerify: (mpesaCode, bankCode) => _processVerification(sdr, 'Manual Code', mpesaCode),
      ),
    );
  }

  void _selectSMS(SDRModel sdr) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SMSSelectionModal(
        sdr: sdr,
        onSelect: (proof) => _verifyWithProof(sdr, proof),
      ),
    );
  }

  void _processVerification(SDRModel sdr, String source, String proof) {
    setState(() => _isLoading = true);
    
    // Simulate verification delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      
      // Create a proof model
      final proofModel = ProofModel(
        code: proof,
        source: source,
        amount: sdr.amount,
        date: DateTime.now(),
        sender: sdr.maskedPhone ?? 'Unknown',
        receiver: 'SME-001',
      );
      
      _verifyWithProof(sdr, proofModel);
    });
  }

  void _verifyWithProof(SDRModel sdr, ProofModel proof) {
    final result = VerificationService.verifySDR(sdr, proof);
    
    if (result.isVerified) {
      final vbr = VerificationService.convertToVBR(sdr, proof);
      
      // Remove from drafts and add to verified VBRs
      setState(() {
        _draftSDRs.removeWhere((item) => item.id == sdr.id);
      });
      
      _showVerificationSuccess(sdr, vbr);
    } else {
      _showErrorSnackBar(result.statusMessage);
    }
  }

  void _showVerificationSuccess(SDRModel sdr, VBRModel vbr) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 2.w),
            Text('Verification Successful!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SDR #${sdr.id} has been successfully verified and converted to VBR.'),
            SizedBox(height: 2.h),
            Text('Blockchain Hash:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 0.5.h),
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                vbr.hash,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Text('Verification Source: ${vbr.source}'),
            Text('Verified At: ${vbr.verifiedAt.toString()}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessSnackBar('Transaction verified and logged to Vault!');
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _deleteSDR(SDRModel sdr) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete SDR'),
        content: Text('Are you sure you want to delete SDR #${sdr.id}? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _draftSDRs.removeWhere((item) => item.id == sdr.id);
              });
              Navigator.pop(context);
              _showSuccessSnackBar('SDR deleted successfully');
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.getSuccessColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.getErrorColor(Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
