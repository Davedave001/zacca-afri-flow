import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomTabBarVariant {
  standard,
  pills,
  underline,
  segmented,
  scrollable,
}

class CustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final CustomTabBarVariant variant;
  final int initialIndex;
  final ValueChanged<int>? onTap;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? indicatorColor;
  final bool isScrollable;
  final EdgeInsets? padding;
  final double? height;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.variant = CustomTabBarVariant.standard,
    this.initialIndex = 0,
    this.onTap,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorColor,
    this.isScrollable = false,
    this.padding,
    this.height,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      initialIndex: widget.initialIndex,
      vsync: this,
    );
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _tabController.addListener(() {
      if (widget.onTap != null && _tabController.indexIsChanging) {
        widget.onTap!(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    switch (widget.variant) {
      case CustomTabBarVariant.standard:
        return _buildStandardTabBar(context, theme, colorScheme);
      case CustomTabBarVariant.pills:
        return _buildPillsTabBar(context, theme, colorScheme);
      case CustomTabBarVariant.underline:
        return _buildUnderlineTabBar(context, theme, colorScheme);
      case CustomTabBarVariant.segmented:
        return _buildSegmentedTabBar(context, theme, colorScheme);
      case CustomTabBarVariant.scrollable:
        return _buildScrollableTabBar(context, theme, colorScheme);
    }
  }

  Widget _buildStandardTabBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      height: widget.height ?? 48,
      padding: widget.padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: widget.isScrollable,
        labelColor: widget.selectedColor ?? colorScheme.primary,
        unselectedLabelColor:
            widget.unselectedColor ?? colorScheme.onSurfaceVariant,
        indicatorColor: widget.indicatorColor ?? colorScheme.primary,
        indicatorWeight: 2.0,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
        ),
        tabs: widget.tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }

  Widget _buildPillsTabBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      height: widget.height ?? 40,
      padding: widget.padding ?? EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: widget.tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == _tabController.index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                _tabController.animateTo(index);
                if (widget.onTap != null) {
                  widget.onTap!(index);
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (widget.selectedColor ?? colorScheme.primary)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected
                          ? colorScheme.onPrimary
                          : (widget.unselectedColor ??
                              colorScheme.onSurfaceVariant),
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildUnderlineTabBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      height: widget.height ?? 44,
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: widget.isScrollable,
        labelColor: widget.selectedColor ?? colorScheme.primary,
        unselectedLabelColor:
            widget.unselectedColor ?? colorScheme.onSurfaceVariant,
        indicatorColor: widget.indicatorColor ?? colorScheme.primary,
        indicatorWeight: 3.0,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
        labelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        tabs: widget.tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }

  Widget _buildSegmentedTabBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      height: widget.height ?? 36,
      padding: widget.padding ?? EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: widget.tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == _tabController.index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                _tabController.animateTo(index);
                if (widget.onTap != null) {
                  widget.onTap!(index);
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (widget.selectedColor ?? colorScheme.surface)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: colorScheme.shadow.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? colorScheme.onSurface
                          : (widget.unselectedColor ??
                              colorScheme.onSurfaceVariant),
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildScrollableTabBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      height: widget.height ?? 50,
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surface,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: widget.tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            final isSelected = index == _tabController.index;

            return GestureDetector(
              onTap: () {
                _tabController.animateTo(index);
                if (widget.onTap != null) {
                  widget.onTap!(index);
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (widget.selectedColor ?? colorScheme.primary)
                      : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? (widget.selectedColor ?? colorScheme.primary)
                        : colorScheme.outline.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  tab,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected
                        ? colorScheme.onPrimary
                        : (widget.unselectedColor ??
                            colorScheme.onSurfaceVariant),
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Helper widget for TabView content
class CustomTabView extends StatelessWidget {
  final TabController controller;
  final List<Widget> children;

  const CustomTabView({
    super.key,
    required this.controller,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: children,
    );
  }
}
