import 'package:flutter/material.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Ventas del día',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Ver todas',
                    style: TextStyle(color: Colors.blue.shade700),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      '\$ ',
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ),
                    Text(
                      '2,109.99',
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.blueGrey.shade800,
                      size: 30,
                    )
                  ],
                )),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ventas: 10',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Clientes: 5',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Productos: 10',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
