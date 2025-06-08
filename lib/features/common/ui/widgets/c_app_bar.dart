import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title can be a Widget (e.g., logo) or a String (text title).
  final dynamic title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;

  const CAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    late final Widget titleWidget;
    if (title is Widget) {
      titleWidget = title as Widget;
    } else {
      titleWidget = Text(
        title as String,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      );
    }

    return AppBar(
      title: titleWidget,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
