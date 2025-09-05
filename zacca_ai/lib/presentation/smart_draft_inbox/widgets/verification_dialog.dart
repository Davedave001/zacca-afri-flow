import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../models/sdr_model.dart';

class VerificationDialog extends StatefulWidget {
  final SDRModel sdr;
  final Function(String mpesaCode, String? bankCode) onVerify;

  const VerificationDialog({
    super.key,
    required this.sdr,
    required this.onVerify,
  });

  @override
  State<VerificationDialog> createState() => _VerificationDialogState();
}

class _VerificationDialogState extends State<VerificationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _mpesaController = TextEditingController();
  final _bankController = TextEditingController();
  bool _isMpesaSelected = true;

  @override
  void dispose() {
    _mpesaController.dispose();
    _bankController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF08F5F8).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10.w / 2),
                  ),
                  child: Icon(
                    Icons.verified,
                    color: Color(0xFF08F5F8),
                    size: 5.w,
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verify SDR #${widget.sdr.id}',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Confirm payment with transaction code',
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
                    'Transaction Summary',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Buyer:', style: theme.textTheme.bodyMedium),
                      Text(
                        widget.sdr.buyer,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Amount:', style: theme.textTheme.bodyMedium),
                      Text(
                        'KES ${widget.sdr.total.toStringAsFixed(0)}',
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
                      Text('Paid:', style: theme.textTheme.bodyMedium),
                      Text(
                        'KES ${widget.sdr.paid.toStringAsFixed(0)}',
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

            // Payment method selection
            Text(
              'Payment Method',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isMpesaSelected = true),
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        color: _isMpesaSelected 
                            ? Color(0xFF08F5F8).withValues(alpha: 0.2)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _isMpesaSelected 
                              ? Color(0xFF08F5F8)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: _isMpesaSelected 
                                ? Color(0xFF08F5F8)
                                : Colors.grey[600],
                            size: 4.w,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'M-Pesa',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: _isMpesaSelected 
                                  ? Color(0xFF08F5F8)
                                  : Colors.grey[600],
                              fontWeight: _isMpesaSelected 
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isMpesaSelected = false),
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        color: !_isMpesaSelected 
                            ? Color(0xFF08F5F8).withValues(alpha: 0.2)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: !_isMpesaSelected 
                              ? Color(0xFF08F5F8)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance,
                            color: !_isMpesaSelected 
                                ? Color(0xFF08F5F8)
                                : Colors.grey[600],
                            size: 4.w,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'Bank',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: !_isMpesaSelected 
                                  ? Color(0xFF08F5F8)
                                  : Colors.grey[600],
                              fontWeight: !_isMpesaSelected 
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),

            // Transaction code input
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isMpesaSelected ? 'M-Pesa Transaction Code' : 'Bank Transaction Code',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  TextFormField(
                    controller: _isMpesaSelected ? _mpesaController : _bankController,
                    decoration: InputDecoration(
                      hintText: _isMpesaSelected 
                          ? 'e.g., QDF123456789'
                          : 'e.g., TXN789456123',
                      prefixIcon: Icon(
                        _isMpesaSelected ? Icons.phone_android : Icons.account_balance,
                        color: Color(0xFF08F5F8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFF08F5F8)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter transaction code';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      'Cancel',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _verifyTransaction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF08F5F8),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Verify Payment',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _verifyTransaction() {
    if (_formKey.currentState!.validate()) {
      final mpesaCode = _mpesaController.text.trim();
      final bankCode = _bankController.text.trim().isEmpty ? null : _bankController.text.trim();
      
      widget.onVerify(mpesaCode, bankCode);
      Navigator.of(context).pop();
    }
  }
}
