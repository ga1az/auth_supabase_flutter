import 'package:flutter/material.dart';

class MenuAnchorWidget extends StatefulWidget {
  const MenuAnchorWidget({super.key});

  @override
  State<MenuAnchorWidget> createState() => _MenuAnchorWidgetState();
}

class _MenuAnchorWidgetState extends State<MenuAnchorWidget> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return ElevatedButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: const Row(
                children: [Icon(Icons.add), Text('Agregar')],
              ));
        },
        menuChildren: List<MenuItemButton>.generate(
            2,
            (int index) => MenuItemButton(
                  onPressed: () {},
                  child: Text('Item $index'),
                )));
  }
}
