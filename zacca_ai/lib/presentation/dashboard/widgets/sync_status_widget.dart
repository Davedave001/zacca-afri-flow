import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class SyncStatusWidget extends StatefulWidget {
  final bool isOnline;
  final DateTime? lastSyncTime;
  final VoidCallback? onRefresh;

  const SyncStatusWidget({
    super.key,
    required this.isOnline,
    this.lastSyncTime,
    this.onRefresh,
  });

  @override
  State<SyncStatusWidget> createState() => _SyncStatusWidgetState();
}

class _SyncStatusWidgetState extends State<SyncStatusWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startSyncAnimation() {
    _animationController.repeat();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        _animationController.stop();
        _animationController.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: widget.isOnline
            ? AppTheme.getSuccessColor(true).withValues(alpha: 0.1)
            : AppTheme.getWarningColor(true).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.isOnline
              ? AppTheme.getSuccessColor(true).withValues(alpha: 0.3)
              : AppTheme.getWarningColor(true).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: widget.isOnline
                      ? AppTheme.getSuccessColor(true)
                      : AppTheme.getWarningColor(true),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                widget.isOnline ? 'Online' : 'Offline',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: widget.isOnline
                      ? AppTheme.getSuccessColor(true)
                      : AppTheme.getWarningColor(true),
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (widget.lastSyncTime != null) ...[
                SizedBox(width: 2.w),
                Text(
                  '• Last sync: ${_formatSyncTime(widget.lastSyncTime!)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
          GestureDetector(
            onTap: () {
              _startSyncAnimation();
              if (widget.onRefresh != null) {
                widget.onRefresh!();
              }
            },
            child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value * 2 * 3.14159,
                  child: CustomIconWidget(
                    iconName: 'refresh',
                    color: colorScheme.onSurfaceVariant,
                    size: 16,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatSyncTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
