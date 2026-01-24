import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomBottomBarVariant {
  standard,
  floating,
  minimal,
  extended,
}

class CustomBottomBar extends StatefulWidget {
  final CustomBottomBarVariant variant;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;
  final bool showLabels;
  final EdgeInsets? margin;

  const CustomBottomBar({
    super.key,
    this.variant = CustomBottomBarVariant.standard,
    this.currentIndex = 0,
    this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation,
    this.showLabels = true,
    this.margin,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  final List<_BottomBarItem> _items = [
    _BottomBarItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
      route: '/dashboard',
    ),
    _BottomBarItem(
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet,
      label: 'Finance',
      route: '/financial-companion',
    ),
    _BottomBarItem(
      icon: Icons.chat_bubble_outline,
      activeIcon: Icons.chat_bubble,
      label: 'WhatsApp',
      route: '/whats-app-import-screen',
    ),
    _BottomBarItem(
      icon: Icons.inbox_outlined,
      activeIcon: Icons.inbox,
      label: 'Drafts',
      route: '/smart-draft-inbox',
    ),
    _BottomBarItem(
      icon: Icons.folder_outlined,
      activeIcon: Icons.folder,
      label: 'Vault',
      route: '/sdr-vault',
    ),
    _BottomBarItem(
      icon: Icons.trending_up_outlined,
      activeIcon: Icons.trending_up,
      label: 'Analytics',
      route: '/business-analytics-dashboard',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    switch (widget.variant) {
      case CustomBottomBarVariant.standard:
        return _buildStandardBottomBar(context, theme, colorScheme);
      case CustomBottomBarVariant.floating:
        return _buildFloatingBottomBar(context, theme, colorScheme);
      case CustomBottomBarVariant.minimal:
        return _buildMinimalBottomBar(context, theme, colorScheme);
      case CustomBottomBarVariant.extended:
        return _buildExtendedBottomBar(context, theme, colorScheme);
    }
  }

  Widget _buildStandardBottomBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == widget.currentIndex;

              return _buildBottomBarItem(
                context,
                colorScheme,
                item,
                isSelected,
                index,
                showLabel: widget.showLabels,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingBottomBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: widget.margin ?? EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isSelected = index == widget.currentIndex;

                  return _buildBottomBarItem(
                    context,
                    colorScheme,
                    item,
                    isSelected,
                    index,
                    showLabel: false,
                    isFloating: true,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMinimalBottomBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.2),
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == widget.currentIndex;

              return _buildMinimalBottomBarItem(
                context,
                colorScheme,
                item,
                isSelected,
                index,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildExtendedBottomBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == widget.currentIndex;

              return _buildExtendedBottomBarItem(
                context,
                colorScheme,
                item,
                isSelected,
                index,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBarItem(
    BuildContext context,
    ColorScheme colorScheme,
    _BottomBarItem item,
    bool isSelected,
    int index, {
    bool showLabel = true,
    bool isFloating = false,
  }) {
    final selectedColor = widget.selectedItemColor ?? colorScheme.primary;
    final unselectedColor =
        widget.unselectedItemColor ?? colorScheme.onSurfaceVariant;

    return GestureDetector(
      onTap: () => _handleTap(index, item.route),
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: isSelected ? _scaleAnimation.value : 1.0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isFloating ? 12 : 8,
                vertical: 8,
              ),
              decoration: isSelected && isFloating
                  ? BoxDecoration(
                      color: selectedColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child: Icon(
                      isSelected ? item.activeIcon : item.icon,
                      key: ValueKey(isSelected),
                      color: isSelected ? selectedColor : unselectedColor,
                      size: 24,
                    ),
                  ),
                  if (showLabel) ...[
                    SizedBox(height: 4),
                    Text(
                      item.label,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected ? selectedColor : unselectedColor,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMinimalBottomBarItem(
    BuildContext context,
    ColorScheme colorScheme,
    _BottomBarItem item,
    bool isSelected,
    int index,
  ) {
    final selectedColor = widget.selectedItemColor ?? colorScheme.primary;
    final unselectedColor =
        widget.unselectedItemColor ?? colorScheme.onSurfaceVariant;

    return GestureDetector(
      onTap: () => _handleTap(index, item.route),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: selectedColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Icon(
          isSelected ? item.activeIcon : item.icon,
          color: isSelected ? selectedColor : unselectedColor,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildExtendedBottomBarItem(
    BuildContext context,
    ColorScheme colorScheme,
    _BottomBarItem item,
    bool isSelected,
    int index,
  ) {
    final selectedColor = widget.selectedItemColor ?? colorScheme.primary;
    final unselectedColor =
        widget.unselectedItemColor ?? colorScheme.onSurfaceVariant;

    return GestureDetector(
      onTap: () => _handleTap(index, item.route),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: selectedColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: selectedColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? item.activeIcon : item.icon,
              color: isSelected ? selectedColor : unselectedColor,
              size: 26,
            ),
            SizedBox(height: 4),
            Text(
              item.label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? selectedColor : unselectedColor,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(int index, String route) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }

    // Navigate to the corresponding route
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        route,
        (route) => false,
      );
    }
  }
}

class _BottomBarItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String route;

  const _BottomBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.route,
  });
}
