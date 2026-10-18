/// Global application configuration and environment settings.
/// Contains credentials and endpoints for Supabase backend integration.
class AppConfig {
  /// Base URL of your Supabase project (e.g., https://your-project-id.supabase.co).
  /// Replace with your Supabase Project URL and Anon (Public) Key.
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';

  /// Anonymous (public) API key used for client-side authentication and querying.
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
}