import 'package:flutter/material.dart';

class IconButtonText extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const IconButtonText(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  State<IconButtonText> createState() => _IconButtonTextState();
}

class _IconButtonTextState extends State<IconButtonText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(widget.icon),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.blueGrey.shade700),
              iconColor: const MaterialStatePropertyAll(Colors.white),
              overlayColor: MaterialStatePropertyAll(Colors.blueGrey.shade500)),
        ),
        Text(widget.text)
      ],
    );
  }
}
