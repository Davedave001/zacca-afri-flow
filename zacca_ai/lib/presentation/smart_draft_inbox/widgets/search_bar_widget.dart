import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool isExpanded;
  final VoidCallback? onToggle;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Search transactions...',
    this.onChanged,
    this.onClear,
    this.isExpanded = false,
    this.onToggle,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

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

    if (widget.isExpanded) {
      _animationController.forward();
    }

    _textController.addListener(() {
      widget.onChanged?.call(_textController.text);
    });
  }

  @override
  void didUpdateWidget(SearchBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _animationController.forward();
        _focusNode.requestFocus();
      } else {
        _animationController.reverse();
        _focusNode.unfocus();
        _textController.clear();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Row(
        children: [
          if (!widget.isExpanded)
            GestureDetector(
              onTap: widget.onToggle,
              child: Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: CustomIconWidget(
                  iconName: 'search',
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ),
            ),
          if (widget.isExpanded)
            Expanded(
              child: AnimatedBuilder(
                animation: _expandAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _expandAnimation.value,
                    alignment: Alignment.centerLeft,
                    child: Opacity(
                      opacity: _expandAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _focusNode.hasFocus
                                ? colorScheme.primary
                                : colorScheme.outline.withValues(alpha: 0.2),
                            width: _focusNode.hasFocus ? 2 : 1,
                          ),
                          boxShadow: _focusNode.hasFocus
                              ? [
                                  BoxShadow(
                                    color: colorScheme.primary
                                        .withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: TextField(
                          controller: _textController,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            hintText: widget.hintText,
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(3.w),
                              child: CustomIconWidget(
                                iconName: 'search',
                                color: colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                            ),
                            suffixIcon: _textController.text.isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      _textController.clear();
                                      widget.onClear?.call();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(3.w),
                                      child: CustomIconWidget(
                                        iconName: 'close',
                                        color: colorScheme.onSurfaceVariant,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                : null,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
                          ),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          if (widget.isExpanded) ...[
            SizedBox(width: 2.w),
            GestureDetector(
              onTap: widget.onToggle,
              child: Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Cancel',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
