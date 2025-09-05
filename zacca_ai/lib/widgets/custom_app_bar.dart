import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomAppBarVariant {
  standard,
  centered,
  minimal,
  dashboard,
  search,
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final CustomAppBarVariant variant;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final bool showNotificationBadge;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onSearchTap;
  final String? searchHint;

  const CustomAppBar({
    super.key,
    this.title,
    this.variant = CustomAppBarVariant.standard,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.onBackPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.showNotificationBadge = false,
    this.onNotificationTap,
    this.onSearchTap,
    this.searchHint,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    switch (variant) {
      case CustomAppBarVariant.standard:
        return _buildStandardAppBar(context, theme, colorScheme, isDark);
      case CustomAppBarVariant.centered:
        return _buildCenteredAppBar(context, theme, colorScheme, isDark);
      case CustomAppBarVariant.minimal:
        return _buildMinimalAppBar(context, theme, colorScheme, isDark);
      case CustomAppBarVariant.dashboard:
        return _buildDashboardAppBar(context, theme, colorScheme, isDark);
      case CustomAppBarVariant.search:
        return _buildSearchAppBar(context, theme, colorScheme, isDark);
    }
  }

  Widget _buildStandardAppBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    bool isDark,
  ) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: foregroundColor ?? colorScheme.onSurface,
                letterSpacing: -0.5,
              ),
            )
          : null,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      foregroundColor: foregroundColor ?? colorScheme.onSurface,
      elevation: elevation ?? 1.0,
      surfaceTintColor: Colors.transparent,
      leading: leading ??
          (automaticallyImplyLeading && Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, size: 20),
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                )
              : null),
      actions: actions ?? _buildDefaultActions(context, colorScheme),
    );
  }

  Widget _buildCenteredAppBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    bool isDark,
  ) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: foregroundColor ?? colorScheme.onSurface,
                letterSpacing: -0.3,
              ),
            )
          : null,
      centerTitle: true,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      foregroundColor: foregroundColor ?? colorScheme.onSurface,
      elevation: elevation ?? 0.5,
      surfaceTintColor: Colors.transparent,
      leading: leading ??
          (automaticallyImplyLeading && Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(Icons.close, size: 22),
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                )
              : null),
      actions: actions,
    );
  }

  Widget _buildMinimalAppBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    bool isDark,
  ) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: foregroundColor ?? colorScheme.onSurface,
                letterSpacing: 0,
              ),
            )
          : null,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: foregroundColor ?? colorScheme.onSurface,
      elevation: elevation ?? 0,
      surfaceTintColor: Colors.transparent,
      leading: leading ??
          (automaticallyImplyLeading && Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, size: 18),
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                )
              : null),
      actions: actions,
    );
  }

  Widget _buildDashboardAppBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    bool isDark,
  ) {
    return AppBar(
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.account_balance_wallet,
              color: colorScheme.onPrimary,
              size: 18,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ZaccaAI',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: foregroundColor ?? colorScheme.onSurface,
                  letterSpacing: -0.3,
                ),
              ),
              Text(
                'Smart Business Finance',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurfaceVariant,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: backgroundColor ?? colorScheme.surface,
      foregroundColor: foregroundColor ?? colorScheme.onSurface,
      elevation: elevation ?? 1.0,
      surfaceTintColor: Colors.transparent,
      leading: leading,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Stack(
            children: [
              Icon(Icons.notifications_outlined, size: 24),
              if (showNotificationBadge)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          onPressed: onNotificationTap,
        ),
        IconButton(
          icon: Icon(Icons.account_circle_outlined, size: 24),
          onPressed: () => _showProfileMenu(context),
        ),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSearchAppBar(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    bool isDark,
  ) {
    return AppBar(
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: searchHint ?? 'Search transactions...',
            hintStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurfaceVariant,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: colorScheme.onSurfaceVariant,
              size: 20,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
          onTap: onSearchTap,
        ),
      ),
      backgroundColor: backgroundColor ?? colorScheme.primary,
      foregroundColor: foregroundColor ?? colorScheme.onPrimary,
      elevation: elevation ?? 1.0,
      surfaceTintColor: Colors.transparent,
      leading: leading ??
          (automaticallyImplyLeading && Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, size: 20),
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                )
              : null),
      actions: actions,
    );
  }

  List<Widget> _buildDefaultActions(
      BuildContext context, ColorScheme colorScheme) {
    return [
      IconButton(
        icon: Icon(Icons.more_vert, size: 20),
        onPressed: () => _showOptionsMenu(context),
      ),
    ];
  }

  void _showProfileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Profile Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('App Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/business-analytics-dashboard');
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.refresh),
              title: Text('Refresh Data'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text('Filter Options'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share Report'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
