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

  // Mock data
  final List<Map<String, dynamic>> _mockTransactions = [
    {
      "id": "sdr_001",
      "contact": "John Mwangi",
      "amount": "15,000",
      "summary":
          "Payment received for website development project. Client confirmed completion of Phase 1 deliverables.",
      "confidenceScore": 0.95,
      "timestamp": DateTime.now().subtract(Duration(hours: 2)),
      "status": "pending",
      "type": "income",
      "category": "Services",
      "extractedEntities": {
        "amount": "KES 15,000",
        "contact": "John Mwangi",
        "service": "Website development",
        "phase": "Phase 1"
      }
    },
    {
      "id": "sdr_002",
      "contact": "Grace Wanjiku",
      "amount": "8,500",
      "summary":
          "Inventory purchase - office supplies and stationery for Q1 operations.",
      "confidenceScore": 0.78,
      "timestamp": DateTime.now().subtract(Duration(hours: 5)),
      "status": "pending",
      "type": "expense",
      "category": "Office Supplies",
      "extractedEntities": {
        "amount": "KES 8,500",
        "contact": "Grace Wanjiku",
        "category": "Office supplies",
        "period": "Q1"
      }
    },
    {
      "id": "sdr_003",
      "contact": "David Kiprotich",
      "amount": "25,000",
      "summary":
          "Monthly retainer payment for digital marketing services. Campaign performance exceeded targets.",
      "confidenceScore": 0.92,
      "timestamp": DateTime.now().subtract(Duration(days: 1, hours: 3)),
      "status": "approved",
      "type": "income",
      "category": "Marketing",
      "extractedEntities": {
        "amount": "KES 25,000",
        "contact": "David Kiprotich",
        "service": "Digital marketing",
        "frequency": "Monthly"
      }
    },
    {
      "id": "sdr_004",
      "contact": "Sarah Njeri",
      "amount": "3,200",
      "summary": "Transport reimbursement for client meetings in Nairobi CBD.",
      "confidenceScore": 0.65,
      "timestamp": DateTime.now().subtract(Duration(days: 1, hours: 8)),
      "status": "rejected",
      "type": "expense",
      "category": "Transport",
      "extractedEntities": {
        "amount": "KES 3,200",
        "contact": "Sarah Njeri",
        "purpose": "Client meetings",
        "location": "Nairobi CBD"
      }
    },
    {
      "id": "sdr_005",
      "contact": "Michael Ochieng",
      "amount": "12,000",
      "summary":
          "Equipment rental for photography session. Invoice includes setup and breakdown services.",
      "confidenceScore": 0.88,
      "timestamp": DateTime.now().subtract(Duration(days: 2, hours: 1)),
      "status": "pending",
      "type": "expense",
      "category": "Equipment",
      "extractedEntities": {
        "amount": "KES 12,000",
        "contact": "Michael Ochieng",
        "service": "Equipment rental",
        "type": "Photography"
      }
    },
    {
      "id": "sdr_006",
      "contact": "Lucy Akinyi",
      "amount": "45,000",
      "summary":
          "Consulting fee for business strategy development. Includes market analysis and growth recommendations.",
      "confidenceScore": 0.97,
      "timestamp": DateTime.now().subtract(Duration(days: 3, hours: 4)),
      "status": "approved",
      "type": "income",
      "category": "Consulting",
      "extractedEntities": {
        "amount": "KES 45,000",
        "contact": "Lucy Akinyi",
        "service": "Business strategy",
        "deliverables": "Market analysis, Growth recommendations"
      }
    }
  ];

  final List<String> _filters = [
    'All',
    'Pending Review',
    'Approved',
    'Rejected'
  ];

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

    // Simulate API call
    await Future.delayed(Duration(milliseconds: 800));

    setState(() => _isLoading = false);
  }

  Future<void> _refreshTransactions() async {
    HapticFeedback.lightImpact();
    await _loadTransactions();
  }

  List<Map<String, dynamic>> get _filteredTransactions {
    List<Map<String, dynamic>> filtered = _mockTransactions;

    // Apply filter
    if (_selectedFilter != 'All') {
      String statusFilter = _selectedFilter.toLowerCase().replaceAll(' ', '');
      if (statusFilter == 'pendingreview') statusFilter = 'pending';
      filtered = filtered
          .where((t) => (t['status'] as String).toLowerCase() == statusFilter)
          .toList();
    }

    // Apply search
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((t) {
        final contact = (t['contact'] as String).toLowerCase();
        final summary = (t['summary'] as String).toLowerCase();
        final amount = (t['amount'] as String).toLowerCase();
        final query = _searchQuery.toLowerCase();

        return contact.contains(query) ||
            summary.contains(query) ||
            amount.contains(query);
      }).toList();
    }

    return filtered;
  }

  Map<String, int> get _filterCounts {
    return {
      'All': _mockTransactions.length,
      'Pending Review':
          _mockTransactions.where((t) => t['status'] == 'pending').length,
      'Approved':
          _mockTransactions.where((t) => t['status'] == 'approved').length,
      'Rejected':
          _mockTransactions.where((t) => t['status'] == 'rejected').length,
    };
  }


  void _toggleSearch() {
    setState(() {
      _isSearchExpanded = !_isSearchExpanded;
      if (!_isSearchExpanded) {
        _searchQuery = '';
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() => _searchQuery = query);
  }

  void _onFilterChanged(String filter) {
    setState(() => _selectedFilter = filter);
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
    HapticFeedback.lightImpact();
    final transaction =
        _mockTransactions.firstWhere((t) => t['id'] == transactionId);
    setState(() {
      transaction['status'] = 'approved';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction approved successfully'),
        backgroundColor: AppTheme.getSuccessColor(
            Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _rejectTransaction(String transactionId) {
    HapticFeedback.lightImpact();
    final transaction =
        _mockTransactions.firstWhere((t) => t['id'] == transactionId);
    setState(() {
      transaction['status'] = 'rejected';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction rejected'),
        backgroundColor: AppTheme.getWarningColor(
            Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }


  void _bulkApprove() {
    HapticFeedback.lightImpact();
    setState(() {
      for (final id in _selectedTransactionIds) {
        final transaction = _mockTransactions.firstWhere((t) => t['id'] == id);
        transaction['status'] = 'approved';
      }
      _selectedTransactionIds.clear();
      _isBulkSelectionMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('${_selectedTransactionIds.length} transactions approved'),
        backgroundColor: AppTheme.getSuccessColor(
            Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _bulkReject() {
    HapticFeedback.lightImpact();
    setState(() {
      for (final id in _selectedTransactionIds) {
        final transaction = _mockTransactions.firstWhere((t) => t['id'] == id);
        transaction['status'] = 'rejected';
      }
      _selectedTransactionIds.clear();
      _isBulkSelectionMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('${_selectedTransactionIds.length} transactions rejected'),
        backgroundColor: AppTheme.getWarningColor(
            Theme.of(context).brightness == Brightness.light),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _bulkDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Transactions'),
        content: Text(
            'Are you sure you want to delete ${_selectedTransactionIds.length} transactions? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              HapticFeedback.mediumImpact();
              setState(() {
                _mockTransactions.removeWhere(
                    (t) => _selectedTransactionIds.contains(t['id']));
                _selectedTransactionIds.clear();
                _isBulkSelectionMode = false;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Transactions deleted'),
                  backgroundColor: AppTheme.getErrorColor(
                      Theme.of(context).brightness == Brightness.light),
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
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: 'Smart Draft Inbox',
        variant: CustomAppBarVariant.standard,
        showNotificationBadge: _filterCounts['Pending Review']! > 0,
        actions: [
          if (!_isBulkSelectionMode)
            IconButton(
              icon: CustomIconWidget(
                iconName: 'search',
                color: colorScheme.onSurface,
                size: 24,
              ),
              onPressed: _toggleSearch,
            ),
          if (_filteredTransactions.isNotEmpty && !_isBulkSelectionMode)
            IconButton(
              icon: CustomIconWidget(
                iconName: 'checklist',
                color: colorScheme.onSurface,
                size: 24,
              ),
              onPressed: _toggleBulkSelection,
            ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          SearchBarWidget(
            isExpanded: _isSearchExpanded,
            onToggle: _toggleSearch,
            onChanged: _onSearchChanged,
            hintText: 'Search by contact, amount, or keywords...',
          ),

          // Filter Chips
          FilterChipsWidget(
            filters: _filters,
            selectedFilter: _selectedFilter,
            onFilterChanged: _onFilterChanged,
            filterCounts: _filterCounts,
          ),

          // Main Content
          Expanded(
            child: _isLoading
                ? _buildLoadingState()
                : _filteredTransactions.isEmpty
                    ? _buildEmptyState()
                    : _buildTransactionsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _importWhatsAppChat,
        backgroundColor: Color(0xFF08F5F8),
        foregroundColor: Colors.white,
        icon: Icon(Icons.chat),
        label: Text('Import WhatsApp Chat'),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bulk Action Bar
          BulkActionBarWidget(
            selectedCount: _selectedTransactionIds.length,
            onApproveAll: _bulkApprove,
            onRejectAll: _bulkReject,
            onDeleteAll: _bulkDelete,
            onCancel: _toggleBulkSelection,
          ),

          // Bottom Navigation
          CustomBottomBar(
            currentIndex: 2, // Inbox tab
            variant: CustomBottomBarVariant.standard,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      itemCount: 5,
      itemBuilder: (context, index) => _buildSkeletonCard(),
    );
  }

  Widget _buildSkeletonCard() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.w,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: colorScheme.outline.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      width: 25.w,
                      height: 1.5.h,
                      decoration: BoxDecoration(
                        color: colorScheme.outline.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 20.w,
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    width: 15.w,
                    height: 1.5.h,
                    decoration: BoxDecoration(
                      color: colorScheme.outline.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Container(
            width: double.infinity,
            height: 3.h,
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget(
      title: _searchQuery.isNotEmpty
          ? 'No Results Found'
          : _selectedFilter == 'All'
              ? 'No Transactions Yet'
              : 'No ${_selectedFilter} Transactions',
      subtitle: _searchQuery.isNotEmpty
          ? 'Try adjusting your search terms or filters to find what you\'re looking for.'
          : _selectedFilter == 'All'
              ? 'Import your first WhatsApp chat to start generating Smart Draft Records automatically.'
              : 'No transactions match the selected filter. Try selecting a different filter.',
      buttonText: _searchQuery.isNotEmpty || _selectedFilter != 'All'
          ? 'Clear Filters'
          : 'Import Your First Chat',
      onButtonPressed: _searchQuery.isNotEmpty || _selectedFilter != 'All'
          ? () {
              setState(() {
                _searchQuery = '';
                _selectedFilter = 'All';
                _isSearchExpanded = false;
              });
            }
          : () => Navigator.pushNamed(context, '/whats-app-import-screen'),
      illustrationUrl:
          'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=300&fit=crop&crop=center',
    );
  }

  Widget _buildTransactionsList() {
    final filteredSDRs = _getFilteredSDRs();

    return RefreshIndicator(
      onRefresh: _refreshTransactions,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(4.w),
        itemCount: filteredSDRs.length,
        itemBuilder: (context, index) {
          final sdr = filteredSDRs[index];
          final isSelected = _selectedTransactionIds.contains(sdr.id);

          return SDRCardWidget(
            sdr: sdr,
            isSelected: _isBulkSelectionMode && isSelected,
            onUploadScreenshot: () => _uploadScreenshot(sdr),
            onPasteCode: () => _pasteCode(sdr),
            onSelectSMS: () => _selectSMS(sdr),
            onDelete: () => _deleteSDR(sdr),
            onLongPress: _isBulkSelectionMode
                ? null
                : () {
                    _toggleBulkSelection();
                    _toggleTransactionSelection(sdr.id);
                  },
          );
        },
      ),
    );
  }

  // Removed unused method _buildTransactionDetailsSheet
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final extractedEntities =
        transaction['extractedEntities'] as Map<String, dynamic>? ?? {};

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            width: 12.w,
            height: 0.5.h,
            margin: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Transaction Details',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: CustomIconWidget(
                    iconName: 'close',
                    color: colorScheme.onSurfaceVariant,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1),

          // Content
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic Info
                  _buildDetailSection(
                    'Transaction Information',
                    [
                      _buildDetailRow(
                          'Contact', transaction['contact'] as String),
                      _buildDetailRow('Amount', 'KES ${transaction['amount']}'),
                      _buildDetailRow('Type',
                          (transaction['type'] as String).toUpperCase()),
                      _buildDetailRow(
                          'Category', transaction['category'] as String),
                      _buildDetailRow('Status',
                          (transaction['status'] as String).toUpperCase()),
                    ],
                  ),

                  SizedBox(height: 3.h),

                  // Summary
                  _buildDetailSection(
                    'AI Summary',
                    [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          transaction['summary'] as String,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 3.h),

                  // Extracted Entities
                  if (extractedEntities.isNotEmpty)
                    _buildDetailSection(
                      'Extracted Information',
                      extractedEntities.entries
                          .map((entry) => _buildDetailRow(
                                entry.key.replaceAll('_', ' ').toUpperCase(),
                                entry.value.toString(),
                              ))
                          .toList(),
                    ),

                  SizedBox(height: 3.h),

                  // Confidence Score
                  _buildDetailSection(
                    'AI Confidence',
                    [
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: transaction['confidenceScore'] as double,
                              backgroundColor:
                                  colorScheme.outline.withValues(alpha: 0.2),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _getConfidenceColor(
                                    transaction['confidenceScore'] as double),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            '${((transaction['confidenceScore'] as double) * 100).toInt()}%',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: _getConfidenceColor(
                                  transaction['confidenceScore'] as double),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 4.h),

                  // Action Buttons
                  if ((transaction['status'] as String) == 'pending')
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _approveTransaction(transaction['id'] as String);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.getSuccessColor(
                                  theme.brightness == Brightness.light),
                              foregroundColor: Colors.white,
                            ),
                            child: Text('Approve'),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _rejectTransaction(transaction['id'] as String);
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.getWarningColor(
                                  theme.brightness == Brightness.light),
                              side: BorderSide(
                                color: AppTheme.getWarningColor(
                                    theme.brightness == Brightness.light),
                              ),
                            ),
                            child: Text('Reject'),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
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
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25.w,
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
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(double score) {
    final theme = Theme.of(context);

    if (score >= 0.9) {
      return AppTheme.getSuccessColor(theme.brightness == Brightness.light);
    } else if (score >= 0.7) {
      return AppTheme.getWarningColor(theme.brightness == Brightness.light);
    } else {
      return AppTheme.getErrorColor(theme.brightness == Brightness.light);
    }
  }

  // SDR Methods
  List<SDRModel> _getFilteredSDRs() {
    List<SDRModel> filtered = _draftSDRs;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((sdr) {
        return sdr.buyer.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               sdr.id.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               sdr.product.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    // Apply status filter
    if (_selectedFilter != 'All') {
      filtered = filtered.where((sdr) => sdr.status == _selectedFilter).toList();
    }

    return filtered;
  }

  void _importWhatsAppChat() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
        allowMultiple: false,
      );

      if (result != null) {
        // Simulate processing
        setState(() {
          _isLoading = true;
        });

        await Future.delayed(Duration(seconds: 2));

        // Add new SDR (simulate AI parsing)
        final newSDR = SDRModel(
          id: "305",
          buyer: "New Customer",
          seller: "Zacca Farm",
          product: "Sample Product",
          quantity: 1,
          amount: 1000,
          status: "Pending Verification",
          date: DateTime.now(),
          chatRef: "WhatsAppExport.txt",
          maskedPhone: "0755XXXXXX",
        );

        setState(() {
          _draftSDRs.insert(0, newSDR);
          _isLoading = false;
        });

        _showSuccessSnackBar('WhatsApp chat imported successfully!');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorSnackBar('Failed to import WhatsApp chat: $e');
    }
  }

  void _uploadScreenshot(SDRModel sdr) {
    showDialog(
      context: context,
      builder: (context) => UploadScreenshotModal(
        sdr: sdr,
        onUpload: (filePath) {
          _processVerification(sdr, 'Screenshot', filePath);
        },
      ),
    );
  }

  void _pasteCode(SDRModel sdr) {
    showDialog(
      context: context,
      builder: (context) => VerificationDialog(
        sdr: sdr,
        onVerify: (mpesaCode, bankCode) {
          final code = mpesaCode.isNotEmpty ? mpesaCode : bankCode!;
          final source = mpesaCode.isNotEmpty ? 'M-Pesa' : 'Bank';
          _processVerification(sdr, source, code);
        },
      ),
    );
  }

  void _selectSMS(SDRModel sdr) {
    showDialog(
      context: context,
      builder: (context) => SMSSelectionModal(
        sdr: sdr,
        onSelect: (proof) {
          _verifyWithProof(sdr, proof);
        },
      ),
    );
  }

  void _processVerification(SDRModel sdr, String source, String proof) {
    // Simulate verification process
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // For demo purposes, always verify successfully
      _verifyWithProof(sdr, ProofModel(
        code: proof,
        source: source,
        amount: sdr.amount,
        date: sdr.date.add(Duration(minutes: 2)),
        sender: sdr.maskedPhone ?? 'Unknown',
        receiver: 'SME-001',
      ));
    });
  }

  void _verifyWithProof(SDRModel sdr, ProofModel proof) {
    final result = VerificationService.verifySDR(sdr, proof);
    
    if (result.isVerified) {
      // Convert to VBR
      final vbr = VerificationService.convertToVBR(sdr, proof);
      
      // Remove from draft SDRs
      setState(() {
        _draftSDRs.removeWhere((item) => item.id == sdr.id);
      });
      
      _showSuccessSnackBar('Transaction verified and logged to Vault!');
      
      // Show success animation
      _showVerificationSuccess(sdr, vbr);
    } else {
      _showErrorSnackBar(result.statusMessage);
    }
  }

  void _showVerificationSuccess(SDRModel sdr, VBRModel vbr) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: Color(0xFF4ADE80).withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.verified,
                color: Color(0xFF4ADE80),
                size: 10.w,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              'Transaction Verified!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Color(0xFF4ADE80),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'SDR #${sdr.id} has been converted to VBR and moved to the Vault.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blockchain Hash:',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    vbr.hash,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('View in Vault'),
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
        content: Text('Are you sure you want to delete SDR #${sdr.id}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _draftSDRs.removeWhere((item) => item.id == sdr.id);
              });
              Navigator.of(context).pop();
              _showSuccessSnackBar('SDR deleted successfully!');
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
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.getErrorColor(true),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
