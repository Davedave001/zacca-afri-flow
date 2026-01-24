import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class IntegratedWalletHealthWidget extends StatefulWidget {
  final double businessHealthScore;
  final String trend;
  final VoidCallback? onTap;
  final VoidCallback? onDeposit;
  final VoidCallback? onWithdraw;
  final VoidCallback? onSavings;
  final VoidCallback? onStatement;

  const IntegratedWalletHealthWidget({
    super.key,
    required this.businessHealthScore,
    required this.trend,
    this.onTap,
    this.onDeposit,
    this.onWithdraw,
    this.onSavings,
    this.onStatement,
  });

  @override
  State<IntegratedWalletHealthWidget> createState() => _IntegratedWalletHealthWidgetState();
}

class _IntegratedWalletHealthWidgetState extends State<IntegratedWalletHealthWidget>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _balanceController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _balanceAnimation;
  
  bool _balanceVisible = true;
  double _walletBalance = 28750.00;
  double _overdraftLimit = 50000.00;
  double _savingsBalance = 12500.00;

  @override
  void initState() {
    super.initState();
    
    _pulseController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _balanceController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    _balanceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _balanceController,
      curve: Curves.easeOut,
    ));
    
    _pulseController.repeat(reverse: true);
    _balanceController.forward();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  void _toggleBalanceVisibility() {
    setState(() {
      _balanceVisible = !_balanceVisible;
    });
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        children: [
          // Integrated Wallet & Health Score Card
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF08F5F8), // Your cyan
                  Color(0xFF3117CE), // Your purple
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF08F5F8).withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header Section
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Welcome & Health Score
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 4.w,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  'Welcome, DAVID',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            // Business Health Score (Compact)
                            GestureDetector(
                              onTap: widget.onTap,
                              child: AnimatedBuilder(
                                animation: _pulseAnimation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _pulseAnimation.value,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 3.w,
                                        vertical: 1.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.trending_up,
                                            color: Colors.white,
                                            size: 3.w,
                                          ),
                                          SizedBox(width: 1.w),
                                          Text(
                                            'Health: ${widget.businessHealthScore.toStringAsFixed(1)}%',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Support & Notifications
                      Row(
                        children: [
                          Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.headset_mic,
                              color: Colors.white,
                              size: 4.w,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 4.w,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Wallet Balance Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    children: [
                      // Main Balance
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ZACCA Wallet Balance (KES)',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              AnimatedBuilder(
                                animation: _balanceAnimation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _balanceAnimation.value,
                                    child: Text(
                                      _balanceVisible ? '${_walletBalance.toStringAsFixed(2)}' : '••••••',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          // Balance Visibility Toggle
                          GestureDetector(
                            onTap: _toggleBalanceVisibility,
                            child: Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _balanceVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.white,
                                size: 4.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      // Overdraft Info
                      Row(
                        children: [
                          Text(
                            'Overdraft ',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            _balanceVisible ? '${_overdraftLimit.toStringAsFixed(2)} KES' : '•••••• KES',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 3.h),
              ],
            ),
          ),
          
          // Wallet Action Buttons
          Container(
            margin: EdgeInsets.only(top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.add,
                  label: 'Deposit',
                  onTap: widget.onDeposit,
                ),
                _buildActionButton(
                  icon: Icons.swap_horiz,
                  label: 'Overdraft',
                  onTap: widget.onWithdraw,
                ),
                _buildActionButton(
                  icon: Icons.credit_card,
                  label: 'MyCards',
                  onTap: widget.onSavings,
                ),
                _buildActionButton(
                  icon: Icons.description,
                  label: 'Statement',
                  onTap: widget.onStatement,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap?.call();
      },
      child: Container(
        width: 18.w,
        child: Column(
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Color(0xFF08F5F8), // Your cyan
                size: 6.w,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
