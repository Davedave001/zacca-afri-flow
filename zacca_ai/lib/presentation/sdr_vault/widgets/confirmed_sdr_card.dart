import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../models/sdr_model.dart';

class ConfirmedSDRCard extends StatelessWidget {
  final SDRModel sdr;
  final VoidCallback? onDownloadPDF;
  final VoidCallback? onShare;
  final bool isSelected;
  final VoidCallback? onLongPress;

  const ConfirmedSDRCard({
    super.key,
    required this.sdr,
    this.onDownloadPDF,
    this.onShare,
    this.isSelected = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        decoration: BoxDecoration(
          color: Color(0xFF4A2BC7), // Lighter purple for confirmed SDRs
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected 
                ? Color(0xFF08F5F8) 
                : Color(0xFF08F5F8).withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF08F5F8).withValues(alpha: 0.15),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with SDR ID and verification status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'SDR #${sdr.id}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      if (sdr.verified) ...[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.5.h),
                          decoration: BoxDecoration(
                            color: Color(0xFF4ADE80).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Color(0xFF4ADE80),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color(0xFF4ADE80),
                                size: 3.w,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                'Verified',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Color(0xFF4ADE80),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    _formatDate(sdr.date),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              
              // Buyer info
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xFF08F5F8),
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Text(
                      sdr.buyer,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              
              // Amount info
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: Color(0xFF08F5F8),
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'KES ${sdr.total.toStringAsFixed(0)}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                    decoration: BoxDecoration(
                      color: Color(0xFF4ADE80).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF4ADE80),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'Paid',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Color(0xFF4ADE80),
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              
              // Blockchain hash if verified
              if (sdr.verified && sdr.blockchainHash != null) ...[
                Row(
                  children: [
                    Icon(
                      Icons.link,
                      color: Color(0xFF08F5F8),
                      size: 4.w,
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: Text(
                        'Hash: ${sdr.blockchainHash!.substring(0, 10)}...',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
              ],
              
              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Download PDF',
                      Icons.download,
                      Color(0xFF4ADE80),
                      onDownloadPDF,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Share',
                      Icons.share,
                      Color(0xFF08F5F8),
                      onShare,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 4.w,
            ),
            SizedBox(width: 1.w),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
