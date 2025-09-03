import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class FileDropZoneWidget extends StatefulWidget {
  final VoidCallback onTap;
  final bool isDragOver;
  final Function(bool) onDragUpdate;

  const FileDropZoneWidget({
    super.key,
    required this.onTap,
    required this.isDragOver,
    required this.onDragUpdate,
  });

  @override
  State<FileDropZoneWidget> createState() => _FileDropZoneWidgetState();
}

class _FileDropZoneWidgetState extends State<FileDropZoneWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
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

  @override
  void didUpdateWidget(FileDropZoneWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDragOver != oldWidget.isDragOver) {
      if (widget.isDragOver) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                width: 90.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: widget.isDragOver
                      ? AppTheme.lightTheme.colorScheme.secondary
                          .withValues(alpha: 0.1)
                      : colorScheme.surface,
                  border: Border.all(
                    color: widget.isDragOver
                        ? AppTheme.lightTheme.colorScheme.secondary
                        : AppTheme.lightTheme.colorScheme.secondary
                            .withValues(alpha: 0.5),
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15.w,
                      height: 15.w,
                      decoration: BoxDecoration(
                        color: AppTheme.lightTheme.colorScheme.secondary
                            .withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: CustomIconWidget(
                          iconName: 'cloud_upload',
                          color: AppTheme.lightTheme.colorScheme.secondary,
                          size: 8.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Drop your WhatsApp chat files here',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'or tap to browse files',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomIconWidget(
                            iconName: 'description',
                            color: colorScheme.onSurfaceVariant,
                            size: 4.w,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'Supports .txt files',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
