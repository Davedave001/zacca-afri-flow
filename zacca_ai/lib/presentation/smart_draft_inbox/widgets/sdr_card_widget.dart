import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../models/sdr_model.dart';

class SDRCardWidget extends StatelessWidget {
  final SDRModel sdr;
  final VoidCallback? onUploadScreenshot;
  final VoidCallback? onPasteCode;
  final VoidCallback? onSelectSMS;
  final VoidCallback? onDelete;
  final bool isSelected;
  final VoidCallback? onLongPress;

  const SDRCardWidget({
    super.key,
    required this.sdr,
    this.onUploadScreenshot,
    this.onPasteCode,
    this.onSelectSMS,
    this.onDelete,
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
          color: Color(0xFF4A2BC7), // Lighter purple for SDR cards
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected 
                ? Color(0xFFFFD93D) // Yellow border for pending verification
                : Color(0xFFFFD93D).withValues(alpha: 0.5),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFFD93D).withValues(alpha: 0.15),
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
                      color: Color(0xFFFFD93D).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFFFD93D),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      sdr.status,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Color(0xFFFFD93D),
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sdr.buyer,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (sdr.maskedPhone != null)
                          Text(
                            sdr.maskedPhone!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              
              // Product info
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
                      '${sdr.quantity}x ${sdr.product}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              
              // Amount and time info
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: Color(0xFF08F5F8),
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'KES ${sdr.amount.toStringAsFixed(0)}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    _formatTime(sdr.date),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              
              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Upload Screenshot',
                      Icons.camera_alt,
                      Color(0xFFFFD93D),
                      onUploadScreenshot,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Paste Code',
                      Icons.content_paste,
                      Color(0xFF08F5F8),
                      onPasteCode,
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
                      'Select SMS',
                      Icons.sms,
                      Color(0xFF4ADE80),
                      onSelectSMS,
                    ),
                  ),
                  SizedBox(width: 2.w),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 3.5.w,
            ),
            SizedBox(width: 0.5.w),
            Flexible(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 9.sp,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
