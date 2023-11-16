import 'package:flutter/material.dart';
import 'package:google_login/features/common/presentation/screens/base_screen_drawer.dart';
import 'package:google_login/features/home/presentation/widgets/card_balance_widget.dart';
import 'package:google_login/features/home/presentation/widgets/navbar_home_widget.dart';
import 'package:google_login/features/home/presentation/widgets/options_home_widget.dart';

class HomeScreen extends BaseScreenDrawer {
  const HomeScreen({Key? key, bool withAppbar = false})
      : super(key: key, withAppBar: withAppbar);

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const NavbarHome(),
          const SizedBox(height: 20),
          const CardBalance(),
          const SizedBox(height: 20),
          OptionsHomeWidget(),
          const SizedBox(height: 40),
          const Text(
            'Vender de nuevo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
