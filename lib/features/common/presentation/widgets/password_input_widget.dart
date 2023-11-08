import 'package:flutter/material.dart';

class PasswordInputWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const PasswordInputWidget(
      {super.key, required this.labelText, required this.controller});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isHidden,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: _togglePasswordView,
          icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
