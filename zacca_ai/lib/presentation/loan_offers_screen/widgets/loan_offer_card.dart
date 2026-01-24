import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class LoanOfferCard extends StatelessWidget {
  final Map<String, dynamic> offer;
  final VoidCallback onTap;
  final bool isQualified;

  const LoanOfferCard({
    super.key,
    required this.offer,
    required this.onTap,
    this.isQualified = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isQualified
                    ? AppTheme.lightTheme.primaryColor
                    : colorScheme.outline.withValues(alpha: 0.3),
                width: isQualified ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, colorScheme),
                SizedBox(height: 2.h),
                _buildLoanDetails(context, colorScheme),
                SizedBox(height: 2.h),
                _buildTermsRow(context, colorScheme),
                SizedBox(height: 2.h),
                _buildActionButtons(context, colorScheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                offer['loanType'] as String,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        if (isQualified)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
            decoration: BoxDecoration(
              color: AppTheme.getSuccessColor(
                      Theme.of(context).brightness == Brightness.light)
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Qualified',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppTheme.getSuccessColor(
                        Theme.of(context).brightness == Brightness.light),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
      ],
    );
  }

  Widget _buildLoanDetails(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loan Amount',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                'KES ${(offer['amount'] as num).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.lightTheme.primaryColor,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: 1,
          height: 6.h,
          color: colorScheme.outline.withValues(alpha: 0.2),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interest Rate',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                '${(offer['interestRate'] as num).toStringAsFixed(1)}% p.a.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTermsRow(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: _buildTermItem(
            context,
            'Repayment Period',
            '${offer['repaymentPeriod']} months',
            colorScheme,
          ),
        ),
        Expanded(
          child: _buildTermItem(
            context,
            'Processing Time',
            offer['processingTime'] as String,
            colorScheme,
          ),
        ),
        Expanded(
          child: _buildTermItem(
            context,
            'Processing Fee',
            'KES ${(offer['processingFee'] as num).toStringAsFixed(0)}',
            colorScheme,
          ),
        ),
      ],
    );
  }

  Widget _buildTermItem(BuildContext context, String label, String value,
      ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: AppTheme.lightTheme.primaryColor,
                width: 1.5,
              ),
              padding: EdgeInsets.symmetric(vertical: 1.5.h),
            ),
            child: Text(
              'View Details',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppTheme.lightTheme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Handle apply now action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.lightTheme.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 1.5.h),
            ),
            child: Text(
              'Apply Now',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
