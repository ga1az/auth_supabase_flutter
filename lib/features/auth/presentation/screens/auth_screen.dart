import 'package:flutter/material.dart';
import 'package:google_login/features/auth/presentation/widgets/login_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoginPage()),
    );
  }
}
