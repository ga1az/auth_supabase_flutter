import 'package:flutter/material.dart';
import 'package:google_login/app.dart';
import 'package:google_login/config/constants/environment.dart';
import 'package:google_login/flavors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  F.appFlavor = Flavor.local;
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
      url: Environment.supabaseUrl,
      anonKey: Environment.supabaseAnonKey,
      authFlowType: AuthFlowType.pkce);
  runApp(const SupaGestor());
}

final supabase = Supabase.instance.client;
