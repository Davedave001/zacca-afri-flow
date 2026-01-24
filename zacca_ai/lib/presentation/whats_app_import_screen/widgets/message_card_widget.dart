import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../models/sdr_model.dart';

class MessageCardWidget extends StatelessWidget {
  final WhatsAppMessage message;
  final VoidCallback? onTap;

  const MessageCardWidget({
    super.key,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: message.isFromBusiness 
              ? Color(0xFF4A2BC7) // Lighter purple for business messages
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: message.isFromBusiness 
                ? Color(0xFF08F5F8).withValues(alpha: 0.3)
                : Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with sender and timestamp
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: message.isFromBusiness 
                            ? Color(0xFF08F5F8)
                            : Color(0xFF3117CE),
                        borderRadius: BorderRadius.circular(8.w / 2),
                      ),
                      child: Icon(
                        message.isFromBusiness ? Icons.business : Icons.person,
                        color: Colors.white,
                        size: 4.w,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.sender,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: message.isFromBusiness 
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        Text(
                          message.isFromBusiness ? 'Business' : 'Customer',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: message.isFromBusiness 
                                ? Colors.white.withValues(alpha: 0.8)
                                : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  _formatTime(message.timestamp),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: message.isFromBusiness 
                        ? Colors.white.withValues(alpha: 0.8)
                        : Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            
            // Message content
            Text(
              message.content,
              style: TextStyle(
                fontSize: 13.sp,
                color: message.isFromBusiness 
                    ? Colors.white
                    : Colors.black87,
                height: 1.4,
              ),
            ),
            
            // Media indicator if present
            if (message.mediaUrl != null) ...[
              SizedBox(height: 1.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: message.isFromBusiness 
                      ? Colors.white.withValues(alpha: 0.2)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.attach_file,
                      size: 4.w,
                      color: message.isFromBusiness 
                          ? Colors.white
                          : Colors.grey[600],
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      'Media attached',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: message.isFromBusiness 
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
