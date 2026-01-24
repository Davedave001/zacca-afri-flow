import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearchChanged;
  final VoidCallback? onSearchTap;
  final bool isVisible;

  const SearchBarWidget({
    super.key,
    required this.onSearchChanged,
    this.onSearchTap,
    this.isVisible = false,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.isVisible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(SearchBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        _animationController.forward();
        Future.delayed(Duration(milliseconds: 300), () {
          if (mounted) {
            _focusNode.requestFocus();
          }
        });
      } else {
        _animationController.reverse();
        _focusNode.unfocus();
        _searchController.clear();
        widget.onSearchChanged('');
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value * 10.h),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.1),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Input
                TextField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  onChanged: widget.onSearchChanged,
                  onTap: widget.onSearchTap,
                  decoration: InputDecoration(
                    hintText: 'Search transactions, contacts, amounts...',
                    hintStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: CustomIconWidget(
                        iconName: 'search',
                        color: colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _searchController.clear();
                              widget.onSearchChanged('');
                            },
                            icon: CustomIconWidget(
                              iconName: 'clear',
                              color: colorScheme.onSurfaceVariant,
                              size: 20,
                            ),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: colorScheme.outline.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: colorScheme.outline.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                  ),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 2.h),
                // Quick Search Suggestions
                _buildQuickSearchSuggestions(theme, colorScheme),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickSearchSuggestions(
      ThemeData theme, ColorScheme colorScheme) {
    final suggestions = [
      'payments from John',
      'last month expenses',
      'income over 10000',
      'M-Pesa transactions',
      'verified records',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Search',
          style: theme.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 1.h),
        Wrap(
          spacing: 2.w,
          runSpacing: 1.h,
          children: suggestions.map((suggestion) {
            return GestureDetector(
              onTap: () {
                _searchController.text = suggestion;
                widget.onSearchChanged(suggestion);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIconWidget(
                      iconName: 'search',
                      color: colorScheme.primary,
                      size: 14,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      suggestion,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
