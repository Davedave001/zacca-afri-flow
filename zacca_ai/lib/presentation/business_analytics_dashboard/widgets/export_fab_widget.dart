import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class ExportFabWidget extends StatefulWidget {
  final VoidCallback? onExportPdf;
  final VoidCallback? onExportCsv;
  final VoidCallback? onShare;

  const ExportFabWidget({
    super.key,
    this.onExportPdf,
    this.onExportCsv,
    this.onShare,
  });

  @override
  State<ExportFabWidget> createState() => _ExportFabWidgetState();
}

class _ExportFabWidgetState extends State<ExportFabWidget>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.75,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedBuilder(
          animation: _expandAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _expandAnimation.value,
              child: Opacity(
                opacity: _expandAnimation.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildActionButton(
                      context,
                      colorScheme,
                      'Share Report',
                      'share',
                      AppTheme.lightTheme.colorScheme.secondary,
                      widget.onShare,
                    ),
                    SizedBox(height: 2.h),
                    _buildActionButton(
                      context,
                      colorScheme,
                      'Export CSV',
                      'table_chart',
                      AppTheme.getSuccessColor(
                          theme.brightness == Brightness.light),
                      widget.onExportCsv,
                    ),
                    SizedBox(height: 2.h),
                    _buildActionButton(
                      context,
                      colorScheme,
                      'Export PDF',
                      'picture_as_pdf',
                      AppTheme.getErrorColor(
                          theme.brightness == Brightness.light),
                      widget.onExportPdf,
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            );
          },
        ),
        FloatingActionButton(
          onPressed: _toggleExpanded,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value * 2 * 3.14159,
                child: CustomIconWidget(
                  iconName: _isExpanded ? 'close' : 'file_download',
                  color: colorScheme.onPrimary,
                  size: 24,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    ColorScheme colorScheme,
    String label,
    String iconName,
    Color backgroundColor,
    VoidCallback? onPressed,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
          ),
        ),
        SizedBox(width: 3.w),
        FloatingActionButton.small(
          onPressed: () {
            _toggleExpanded();
            if (onPressed != null) {
              Future.delayed(Duration(milliseconds: 100), onPressed);
            }
          },
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          heroTag: label,
          child: CustomIconWidget(
            iconName: iconName,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
