import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BaseScreenDrawer extends StatefulWidget {
  final bool withAppBar;
  final String titleAppBar;

  const BaseScreenDrawer(
      {super.key, this.withAppBar = true, this.titleAppBar = ''});

  Widget body(BuildContext context);
  @override
  State<BaseScreenDrawer> createState() => _BaseScreenDrawerState();
}

class _BaseScreenDrawerState extends State<BaseScreenDrawer> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) => widget.body(context),
      ),
      appBar: widget.withAppBar
          ? AppBar(
              title: Text(widget.titleAppBar),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigator with goRouter
          if (index == 0) {
            GoRouter.of(context).go('/home');
          } else if (index == 1) {
            GoRouter.of(context).go('/home/dashboard');
          } else if (index == 2) {
            GoRouter.of(context).go('/home/settings');
          }
        },
      ),
    );
  }
}
