import 'package:flutter/material.dart';
import 'package:google_login/features/common/presentation/screens/base_screen_drawer.dart';
import 'package:google_login/features/common/presentation/widgets/icon_button_text.widget.dart';
import 'package:google_login/features/home/presentation/widgets/card_balance_widget.dart';
import 'package:google_login/features/home/presentation/widgets/navbar_home_widget.dart';

class HomeScreen extends BaseScreenDrawer {
  const HomeScreen({Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonText(
                  text: 'Venta',
                  icon: Icons.transfer_within_a_station_outlined,
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
