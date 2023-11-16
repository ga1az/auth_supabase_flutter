import 'package:flutter/material.dart';
import 'package:google_login/features/common/presentation/screens/base_screen_drawer.dart';
import 'package:google_login/features/inventory/presentation/widgets/menu_anchor_widget.dart';

class InventoryScreen extends BaseScreenDrawer {
  const InventoryScreen({Key? key, String titleAppBar = "Inventario"})
      : super(key: key, titleAppBar: titleAppBar);

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tus productos',
                style: TextStyle(fontSize: 16),
              ),
              MenuAnchorWidget()
            ],
          )
        ]));
  }
}
