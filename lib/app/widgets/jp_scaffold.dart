import 'package:flutter/material.dart';
import 'package:justplay/app/theme/jp_colors.dart';
import 'package:justplay/app/widgets/jp_exit_app.dart';

class JpScaffold extends StatefulWidget {
  final Widget? body;
  final List<NavigationItem>? navigationItems;
  final bool preventExitApp;
  final EdgeInsets? padding;

  const JpScaffold({
    super.key,
    this.body,
    this.navigationItems,
    this.preventExitApp = false,
    this.padding,
  }) : assert(body != null || navigationItems != null);

  @override
  State<JpScaffold> createState() => _JpScaffoldState();
}

class _JpScaffoldState extends State<JpScaffold> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JpExitApp(
        child: SafeArea(
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: widget.body ??
                IndexedStack(
                  index: index,
                  children: [
                    for (int i = 0; i < widget.navigationItems!.length; i++)
                      widget.navigationItems![i].screen,
                  ],
                ),
          ),
        ),
      ),
      bottomNavigationBar: widget.navigationItems != null
          ? BottomNavigationBar(
              onTap: (value) {
                index = value;
                setState(() {});
              },
              selectedItemColor: JpColors.orange,
              unselectedItemColor: JpColors.orangeLight,
              items: [
                for (int i = 0; i < widget.navigationItems!.length; i++)
                  BottomNavigationBarItem(
                    icon: Icon(widget.navigationItems![i].icon),
                    label: widget.navigationItems![i].label,
                  ),
              ],
            )
          : null,
    );
  }
}

class NavigationItem {
  final String label;
  final IconData icon;
  final Widget screen;

  NavigationItem({
    required this.label,
    required this.icon,
    required this.screen,
  });
}
