import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../models/sdr_model.dart';
import '../../../data/sample_data.dart';

class SMSSelectionModal extends StatefulWidget {
  final SDRModel sdr;
  final Function(ProofModel proof) onSelect;

  const SMSSelectionModal({
    super.key,
    required this.sdr,
    required this.onSelect,
  });

  @override
  State<SMSSelectionModal> createState() => _SMSSelectionModalState();
}

class _SMSSelectionModalState extends State<SMSSelectionModal> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sampleProofs = SampleData.sampleProofs;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 70.h,
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF4ADE80).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10.w / 2),
                  ),
                  child: Icon(
                    Icons.sms,
                    color: Color(0xFF4ADE80),
                    size: 5.w,
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select SMS Receipt',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'SDR #${widget.sdr.id}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 3.h),

            // SDR Summary
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Color(0xFF4A2BC7).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFF08F5F8).withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expected Transaction',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount:', style: theme.textTheme.bodyMedium),
                      Text(
                        'KES ${widget.sdr.amount.toStringAsFixed(0)}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF08F5F8),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Time:', style: theme.textTheme.bodyMedium),
                      Text(
                        _formatTime(widget.sdr.date),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),

            // SMS List
            Text(
              'Available SMS Receipts',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            Expanded(
              child: ListView.builder(
                itemCount: sampleProofs.length,
                itemBuilder: (context, index) {
                  final proof = sampleProofs[index];
                  final isMatch = _isPotentialMatch(proof);
                  
                  return Container(
                    margin: EdgeInsets.only(bottom: 2.h),
                    decoration: BoxDecoration(
                      color: isMatch 
                          ? Color(0xFF4ADE80).withValues(alpha: 0.1)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isMatch 
                            ? Color(0xFF4ADE80)
                            : Colors.grey.shade300,
                        width: isMatch ? 2 : 1,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(3.w),
                      leading: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          color: isMatch 
                              ? Color(0xFF4ADE80)
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(12.w / 2),
                        ),
                        child: Icon(
                          proof.source == 'M-Pesa' ? Icons.phone_android : Icons.account_balance,
                          color: Colors.white,
                          size: 6.w,
                        ),
                      ),
                      title: Text(
                        '${proof.source} Receipt',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isMatch ? Color(0xFF4ADE80) : Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 0.5.h),
                          Text(
                            'Code: ${proof.code}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'monospace',
                            ),
                          ),
                          Text(
                            'Amount: KES ${proof.amount.toStringAsFixed(0)}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Time: ${_formatTime(proof.date)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          if (isMatch) ...[
                            SizedBox(height: 0.5.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                              decoration: BoxDecoration(
                                color: Color(0xFF4ADE80),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Potential Match',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 4.w,
                        color: isMatch ? Color(0xFF4ADE80) : Colors.grey[400],
                      ),
                      onTap: () {
                        widget.onSelect(proof);
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isPotentialMatch(ProofModel proof) {
    // Check if amount and time are close to SDR
    final amountMatch = (widget.sdr.amount - proof.amount).abs() < 100;
    final timeMatch = widget.sdr.date.difference(proof.date).abs().inMinutes <= 30;
    
    return amountMatch && timeMatch;
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
