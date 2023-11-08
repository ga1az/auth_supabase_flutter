import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_login/features/common/presentation/widgets/password_input_widget.dart';
import 'package:google_login/main_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  late final StreamSubscription<AuthState> _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        GoRouter.of(context).go('/home');
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(label: Text("Email")),
          ),
          const SizedBox(height: 12),
          PasswordInputWidget(
              labelText: 'Contraseña', controller: _passwordController),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: _loading
                  ? null
                  : () async {
                      try {
                        setState(() {
                          _loading = true;
                        });
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();
                        await supabase.auth.signInWithPassword(
                            password: password, email: email);
                        setState(() {
                          _loading = false;
                        });
                        if (mounted) {
                          GoRouter.of(context).go('/home');
                        }
                      } on AuthException catch (error) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(error.message),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ));
                        }
                      } catch (error) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                                'Error logging in, please try again!'),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ));
                        }
                      }
                    },
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text('Login')),
          const SizedBox(height: 12),
          // no tienes una cuenta? Registrate
          InkWell(
            onTap: () {
              GoRouter.of(context).go('/register');
            },
            child: const Text('No tienes una cuenta? Registrate'),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).go('/home'),
            child: const Text('Olvidaste tu contraseña?'),
          )
        ],
      ),
    );
  }
}
