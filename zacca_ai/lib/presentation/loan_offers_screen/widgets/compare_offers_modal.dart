import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class CompareOffersModal extends StatefulWidget {
  final List<Map<String, dynamic>> offers;

  const CompareOffersModal({
    super.key,
    required this.offers,
  });

  @override
  State<CompareOffersModal> createState() => _CompareOffersModalState();
}

class _CompareOffersModalState extends State<CompareOffersModal> {
  String sortBy = 'interest_rate';
  bool ascending = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final sortedOffers = _getSortedOffers();

    return Container(
      height: 85.h,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(theme, colorScheme),
          _buildSortingOptions(theme, colorScheme),
          Expanded(
            child: _buildComparisonTable(sortedOffers, theme, colorScheme),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            'Compare Loan Offers',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          Spacer(),
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
    );
  }

  Widget _buildSortingOptions(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(4.w),
      child: Row(
        children: [
          CustomIconWidget(
            iconName: 'sort',
            color: colorScheme.onSurfaceVariant,
            size: 20,
          ),
          SizedBox(width: 2.w),
          Text(
            'Sort by:',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSortChip(
                      'Interest Rate', 'interest_rate', theme, colorScheme),
                  SizedBox(width: 2.w),
                  _buildSortChip('Amount', 'amount', theme, colorScheme),
                  SizedBox(width: 2.w),
                  _buildSortChip(
                      'Duration', 'repayment_period', theme, colorScheme),
                  SizedBox(width: 2.w),
                  _buildSortChip(
                      'Processing Time', 'processing_time', theme, colorScheme),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                ascending = !ascending;
              });
            },
            icon: CustomIconWidget(
              iconName: ascending ? 'arrow_upward' : 'arrow_downward',
              color: AppTheme.lightTheme.primaryColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortChip(
      String label, String value, ThemeData theme, ColorScheme colorScheme) {
    final isSelected = sortBy == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          sortBy = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.lightTheme.primaryColor
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppTheme.lightTheme.primaryColor
                : colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isSelected ? Colors.white : colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildComparisonTable(List<Map<String, dynamic>> offers,
      ThemeData theme, ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header row
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Bank',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Amount',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Rate',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Period',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Action',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Data rows
          ...offers
              .map((offer) => _buildComparisonRow(offer, theme, colorScheme))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildComparisonRow(
      Map<String, dynamic> offer, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CustomImageWidget(
                      imageUrl: offer['bankLogo'] as String,
                      width: 8.w,
                      height: 8.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Text(
                    offer['bankName'] as String,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              'KES ${(offer['amount'] as num).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${(offer['interestRate'] as num).toStringAsFixed(1)}%',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${offer['repaymentPeriod']}m',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Handle apply action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.lightTheme.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 0.8.h),
                minimumSize: Size(0, 0),
              ),
              child: Text(
                'Apply',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getSortedOffers() {
    final offers = List<Map<String, dynamic>>.from(widget.offers);

    offers.sort((a, b) {
      dynamic aValue, bValue;

      switch (sortBy) {
        case 'interest_rate':
          aValue = a['interestRate'] as num;
          bValue = b['interestRate'] as num;
          break;
        case 'amount':
          aValue = a['amount'] as num;
          bValue = b['amount'] as num;
          break;
        case 'repayment_period':
          aValue = a['repaymentPeriod'] as num;
          bValue = b['repaymentPeriod'] as num;
          break;
        case 'processing_time':
          aValue = _getProcessingTimeValue(a['processingTime'] as String);
          bValue = _getProcessingTimeValue(b['processingTime'] as String);
          break;
        default:
          return 0;
      }

      final comparison =
          ascending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);

      return comparison;
    });

    return offers;
  }

  int _getProcessingTimeValue(String processingTime) {
    final match = RegExp(r'(\d+)').firstMatch(processingTime);
    return match != null ? int.parse(match.group(1)!) : 0;
  }
}
