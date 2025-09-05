import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../models/sdr_model.dart';

class SDRCardWidget extends StatelessWidget {
  final SDRModel sdr;
  final VoidCallback? onViewPDF;
  final VoidCallback? onEdit;
  final VoidCallback? onVerify;
  final VoidCallback? onUploadToLedger;
  final VoidCallback? onDelete;
  final bool isSelected;
  final VoidCallback? onLongPress;

  const SDRCardWidget({
    super.key,
    required this.sdr,
    this.onViewPDF,
    this.onEdit,
    this.onVerify,
    this.onUploadToLedger,
    this.onDelete,
    this.isSelected = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        decoration: BoxDecoration(
          color: Color(0xFF4A2BC7), // Lighter purple for SDR cards
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
              // Header with SDR ID and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SDR #${sdr.id}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                    decoration: BoxDecoration(
                      color: _getStatusColor(sdr.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _getStatusColor(sdr.status),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      sdr.status,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _getStatusColor(sdr.status),
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              
              // Buyer/Seller info
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
              
              // Items summary
              Row(
                children: [
                  Icon(
                    Icons.inventory,
                    color: Color(0xFF08F5F8),
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Text(
                      _getItemsSummary(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
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
                  if (sdr.paid > 0) ...[
                    SizedBox(width: 2.w),
                    Text(
                      '(Paid: KES ${sdr.paid.toStringAsFixed(0)})',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 2.h),
              
              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'View PDF',
                      Icons.picture_as_pdf,
                      Color(0xFFFF6B6B),
                      onViewPDF,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Edit',
                      Icons.edit,
                      Color(0xFF4ADE80),
                      onEdit,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Verify',
                      Icons.verified,
                      Color(0xFF08F5F8),
                      onVerify,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Upload',
                      Icons.cloud_upload,
                      Color(0xFFFFD93D),
                      onUploadToLedger,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Delete',
                      Icons.delete,
                      Color(0xFFFF4757),
                      onDelete,
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

  String _getItemsSummary() {
    if (sdr.items.isEmpty) return 'No items';
    
    final totalItems = sdr.items.fold<int>(0, (sum, item) => sum + item.quantity);
    final itemNames = sdr.items.map((item) => item.product).join(', ');
    
    return '$totalItems items: $itemNames';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return Color(0xFF4ADE80); // Green
      case 'partial payment':
        return Color(0xFFFFD93D); // Yellow
      case 'pending':
        return Color(0xFFFF6B6B); // Red
      default:
        return Color(0xFF08F5F8); // Cyan
    }
  }
}
