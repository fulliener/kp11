import 'package:flutter/material.dart';
import 'package:prak8/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zatwiikvmqwlfdwwufnb.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InphdHdpaWt2bXF3bGZkd3d1Zm5iIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ0MDAwMTcsImV4cCI6MjA0OTk3NjAxN30.cCIpAGrqg7rqrpFiT_aN4Nyb47uykmTlk6XKeZXO_nA',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: AuthGate(),
    );
  }
}