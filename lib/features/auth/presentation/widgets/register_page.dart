import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_login/main_local.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //loading state
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void registerHandler() async {
    try {
      // loading
      setState(() {
        _isLoading = true;
      });
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      await supabase.auth.signUp(password: password, email: email);
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        GoRouter.of(context).go('/login');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register'), actions: [
        TextButton(
            onPressed: () {
              GoRouter.of(context).go('/login');
            },
            child: const Text('Login'))
      ]),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(label: Text('Email')),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(label: Text('Password')),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: registerHandler,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Register'))
        ],
      ),
    );
  }
}
