import 'package:flutter/material.dart';
import 'package:google_login/config/router.dart';
import 'package:google_login/config/theme.dart';
import 'package:google_login/flavors.dart';

class SupaGestor extends StatelessWidget {
  const SupaGestor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
