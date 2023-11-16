import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_login/features/common/presentation/widgets/icon_button_text_widget.dart';

class OptionsHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButtonText(
          text: 'venta',
          icon: Icons.sell,
          onPressed: () {
            GoRouter.of(context).go('/home/sales');
          },
        ),
        IconButtonText(
          text: 'Inventario',
          icon: Icons.inventory,
          onPressed: () {
            GoRouter.of(context).go('/home/inventory');
          },
        ),
        IconButtonText(
          text: 'Clientes',
          icon: Icons.people,
          onPressed: () {
            GoRouter.of(context).go('/home/custumers');
          },
        ),
        IconButtonText(
          icon: Icons.more_horiz,
          text: 'Más',
          onPressed: () {},
        ),
      ],
    );
  }
}
