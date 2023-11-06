import 'package:flutter/material.dart';
import 'package:google_login/app.dart';
import 'package:google_login/flavors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  F.appFlavor = Flavor.local;
  await Supabase.initialize(
      url: "", anonKey: "", authFlowType: AuthFlowType.pkce);
  runApp(const SupaGestor());
}

final supabase = Supabase.instance.client;
