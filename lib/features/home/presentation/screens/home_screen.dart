import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_login/main_local.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(50),
          children: [
            const Center(child: Text("Home Screen")),
            Text(supabase.auth.currentUser!.email ?? "No email"),
            ElevatedButton(
              onPressed: () {
                supabase.auth.signOut();
                GoRouter.of(context).go('/login');
              },
              child: const Text("Logout"),
            ),
          ],
        ));
  }
}
