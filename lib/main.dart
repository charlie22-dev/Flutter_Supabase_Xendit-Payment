import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/app_config.dart';
import 'screens/product_list_screen.dart';

/// Application entry point.
/// Initializes Flutter engine bindings and connects to Supabase client before running the UI.
Future<void> main() async {
  // Ensures Flutter framework binding is initialized before calling async platform services
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase client with project URL and public anon key
  await Supabase.initialize(
    url: AppConfig.supabaseUrl,
    anonKey: AppConfig.supabaseAnonKey,
  );

  // Mount the root widget tree of the application
  runApp(const StudentEcommerceApp());
}

/// Root widget for Student Shop application.
/// Configures MaterialApp global theme, Material 3 styling, and default home screen.
class StudentEcommerceApp extends StatelessWidget {
  const StudentEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable debug banner for cleaner presentation
      debugShowCheckedModeBanner: false,
      title: 'Student Shop',
      theme: ThemeData(
        // Seed color used to generate harmonious Material 3 color palette
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // Default starting screen showing available products catalog
      home: const ProductListScreen(),
    );
  }
}