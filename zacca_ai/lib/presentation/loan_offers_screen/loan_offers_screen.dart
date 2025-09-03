import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import './widgets/application_tracking_section.dart';
import './widgets/business_health_header.dart';
import './widgets/compare_offers_modal.dart';
import './widgets/empty_state_widget.dart';
import './widgets/filter_chips.dart';
import './widgets/loan_offer_card.dart';

class LoanOffersScreen extends StatefulWidget {
  const LoanOffersScreen({super.key});

  @override
  State<LoanOffersScreen> createState() => _LoanOffersScreenState();
}

class _LoanOffersScreenState extends State<LoanOffersScreen> {
  List<String> selectedFilters = [];
  bool isLoading = false;
  List<Map<String, dynamic>> selectedOffersForComparison = [];

  // Mock data for loan offers
  final List<Map<String, dynamic>> loanOffers = [
    {
      "id": 1,
      "bankName": "Equity Bank Kenya",
      "bankLogo":
          "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=200&h=200&fit=crop&crop=center",
      "loanType": "Working Capital Loan",
      "amount": 500000,
      "interestRate": 12.5,
      "repaymentPeriod": 24,
      "processingTime": "3-5 business days",
      "processingFee": 2500,
      "isQualified": true,
      "requirements": [
        "Business registration",
        "6 months bank statements",
        "KRA PIN"
      ],
      "features": [
        "Flexible repayment",
        "No collateral required",
        "Quick approval"
      ],
      "category": "working_capital"
    },
    {
      "id": 2,
      "bankName": "KCB Bank Kenya",
      "bankLogo":
          "https://images.unsplash.com/photo-1541354329998-f4d9a9f9297f?w=200&h=200&fit=crop&crop=center",
      "loanType": "SME Growth Loan",
      "amount": 750000,
      "interestRate": 14.0,
      "repaymentPeriod": 36,
      "processingTime": "5-7 business days",
      "processingFee": 3750,
      "isQualified": true,
      "requirements": ["Business license", "Audited financials", "Collateral"],
      "features": [
        "Competitive rates",
        "Grace period available",
        "Business advisory"
      ],
      "category": "expansion"
    },
    {
      "id": 3,
      "bankName": "Cooperative Bank",
      "bankLogo":
          "https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=200&h=200&fit=crop&crop=center",
      "loanType": "Equipment Financing",
      "amount": 300000,
      "interestRate": 11.8,
      "repaymentPeriod": 18,
      "processingTime": "2-3 business days",
      "processingFee": 1500,
      "isQualified": true,
      "requirements": ["Equipment quotation", "Business permit", "Guarantor"],
      "features": ["Asset-backed", "Low interest", "Quick processing"],
      "category": "equipment"
    },
    {
      "id": 4,
      "bankName": "NCBA Bank Kenya",
      "bankLogo":
          "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=200&h=200&fit=crop&crop=center",
      "loanType": "Emergency Business Loan",
      "amount": 200000,
      "interestRate": 16.5,
      "repaymentPeriod": 12,
      "processingTime": "24 hours",
      "processingFee": 2000,
      "isQualified": false,
      "requirements": ["M-Pesa statements", "Business registration", "ID copy"],
      "features": [
        "Same day approval",
        "Minimal documentation",
        "Digital application"
      ],
      "category": "emergency"
    },
  ];

  // Mock data for application tracking
  final List<Map<String, dynamic>> applications = [
    {
      "id": 1,
      "bankName": "Equity Bank Kenya",
      "bankLogo":
          "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=200&h=200&fit=crop&crop=center",
      "amount": 500000,
      "status": "review",
      "appliedDate": "15 Dec 2024",
      "nextStep": "Document verification pending",
      "applicationId": "EQ2024001234"
    },
    {
      "id": 2,
      "bankName": "KCB Bank Kenya",
      "bankLogo":
          "https://images.unsplash.com/photo-1541354329998-f4d9a9f9297f?w=200&h=200&fit=crop&crop=center",
      "amount": 300000,
      "status": "approved",
      "appliedDate": "10 Dec 2024",
      "nextStep": "Loan disbursement scheduled",
      "applicationId": "KCB2024005678"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filteredOffers = _getFilteredOffers();
    final qualifiedOffers =
        filteredOffers.where((offer) => offer['isQualified'] == true).toList();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: 'Loan Offers',
        variant: CustomAppBarVariant.standard,
        actions: [
          IconButton(
            onPressed: () => _showNotificationInfo(context),
            icon: Stack(
              children: [
                CustomIconWidget(
                  iconName: 'notifications_outlined',
                  color: colorScheme.onSurface,
                  size: 24,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppTheme.getErrorColor(
                          theme.brightness == Brightness.light),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _refreshOffers(),
            icon: CustomIconWidget(
              iconName: 'refresh',
              color: colorScheme.onSurface,
              size: 24,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshOffers,
        child: CustomScrollView(
          slivers: [
            // Business Health Header
            SliverToBoxAdapter(
              child: BusinessHealthHeader(
                healthScore: 78,
                qualificationStatus: 'Excellent Credit Standing',
                onInfoTap: () => _showQualificationInfo(context),
              ),
            ),

            // Filter Chips
            SliverToBoxAdapter(
              child: FilterChips(
                selectedFilters: selectedFilters,
                onFiltersChanged: (filters) {
                  setState(() {
                    selectedFilters = filters;
                  });
                },
              ),
            ),

            // Loan Offers Section
            if (qualifiedOffers.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Text(
                        'Available Offers (${qualifiedOffers.length})',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Spacer(),
                      if (qualifiedOffers.length > 1)
                        TextButton(
                          onPressed: () =>
                              _showCompareModal(context, qualifiedOffers),
                          child: Text(
                            'Compare All',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: AppTheme.lightTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final offer = qualifiedOffers[index];
                    return LoanOfferCard(
                      offer: offer,
                      isQualified: offer['isQualified'] as bool,
                      onTap: () => _showOfferDetails(context, offer),
                    );
                  },
                  childCount: qualifiedOffers.length,
                ),
              ),
            ],

            // Non-qualified offers section
            if (filteredOffers
                .where((offer) => offer['isQualified'] == false)
                .isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Text(
                    'Other Available Offers',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final nonQualifiedOffers = filteredOffers
                        .where((offer) => offer['isQualified'] == false)
                        .toList();
                    final offer = nonQualifiedOffers[index];
                    return LoanOfferCard(
                      offer: offer,
                      isQualified: false,
                      onTap: () => _showOfferDetails(context, offer),
                    );
                  },
                  childCount: filteredOffers
                      .where((offer) => offer['isQualified'] == false)
                      .length,
                ),
              ),
            ],

            // Application Tracking Section
            SliverToBoxAdapter(
              child: ApplicationTrackingSection(
                applications: applications,
              ),
            ),

            // Empty state if no offers
            if (filteredOffers.isEmpty)
              SliverFillRemaining(
                child: EmptyStateWidget(
                  title: 'No Loan Offers Available',
                  description:
                      'We couldn\'t find any loan offers matching your current business profile. Follow the tips below to improve your qualification.',
                  actionText: 'Upload Business Data',
                  iconName: 'credit_score',
                  onActionPressed: () {
                    Navigator.pushNamed(context, '/whats-app-import-screen');
                  },
                ),
              ),

            // Bottom spacing
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 4, // Assuming this is the 5th tab (index 4)
        variant: CustomBottomBarVariant.standard,
        onTap: (index) {
          // Handle bottom navigation
        },
      ),
      floatingActionButton: qualifiedOffers.length > 1
          ? FloatingActionButton.extended(
              onPressed: () => _showCompareModal(context, qualifiedOffers),
              backgroundColor: AppTheme.lightTheme.primaryColor,
              foregroundColor: Colors.white,
              icon: CustomIconWidget(
                iconName: 'compare_arrows',
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                'Compare Offers',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
    );
  }

  List<Map<String, dynamic>> _getFilteredOffers() {
    if (selectedFilters.isEmpty) {
      return loanOffers;
    }

    return loanOffers.where((offer) {
      return selectedFilters.any((filter) {
        switch (filter) {
          case 'working_capital':
          case 'equipment':
          case 'expansion':
          case 'emergency':
            return offer['category'] == filter;
          case 'low_interest':
            return (offer['interestRate'] as num) < 13.0;
          case 'quick_approval':
            return (offer['processingTime'] as String).contains('24 hours') ||
                (offer['processingTime'] as String).contains('1-2');
          default:
            return false;
        }
      });
    }).toList();
  }

  Future<void> _refreshOffers() async {
    setState(() {
      isLoading = true;
    });

    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Loan offers updated successfully'),
        backgroundColor: AppTheme.getSuccessColor(
            Theme.of(context).brightness == Brightness.light),
      ),
    );
  }

  void _showQualificationInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 60.h,
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Why Am I Qualified?',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: CustomIconWidget(
                    iconName: 'close',
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildQualificationFactor('Transaction Volume',
                        'KES 2.5M monthly', 'trending_up', true),
                    _buildQualificationFactor('Payment History',
                        '95% on-time payments', 'schedule', true),
                    _buildQualificationFactor(
                        'Business Age', '2.5 years verified', 'business', true),
                    _buildQualificationFactor(
                        'KYB Status', 'Fully verified', 'verified', true),
                    _buildQualificationFactor('Credit Score',
                        '78/100 (Excellent)', 'credit_score', true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQualificationFactor(
      String title, String value, String iconName, bool isPositive) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              color: isPositive
                  ? AppTheme.getSuccessColor(
                          theme.brightness == Brightness.light)
                      .withValues(alpha: 0.1)
                  : AppTheme.getErrorColor(theme.brightness == Brightness.light)
                      .withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomIconWidget(
                iconName: iconName,
                color: isPositive
                    ? AppTheme.getSuccessColor(
                        theme.brightness == Brightness.light)
                    : AppTheme.getErrorColor(
                        theme.brightness == Brightness.light),
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  value,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showOfferDetails(BuildContext context, Map<String, dynamic> offer) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 85.h,
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomImageWidget(
                      imageUrl: offer['bankLogo'] as String,
                      width: 12.w,
                      height: 12.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer['bankName'] as String,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        offer['loanType'] as String,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: CustomIconWidget(
                    iconName: 'close',
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Loan details section would go here
                    Text(
                      'Loan Details',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 2.h),
                    // Add more detailed information here
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Handle apply action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.lightTheme.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                ),
                child: Text(
                  'Apply for This Loan',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCompareModal(
      BuildContext context, List<Map<String, dynamic>> offers) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => CompareOffersModal(offers: offers),
    );
  }

  void _showNotificationInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Loan Notifications'),
        content: Text(
            'You have 2 new loan offers and 1 application update available.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
