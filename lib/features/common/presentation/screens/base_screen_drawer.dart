import 'package:flutter/material.dart';
import 'package:google_login/features/home/presentation/widgets/sidebar_widget.dart';

abstract class BaseScreenDrawer extends StatefulWidget {
  const BaseScreenDrawer({super.key});

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
        },
      ),
    );
  }
}
