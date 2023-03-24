import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://ynojtnvbhcizklalzkqp.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlub2p0bnZiaGNpemtsYWx6a3FwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU4ODE1NTgsImV4cCI6MTk5MTQ1NzU1OH0.kykT0vQFlIlr9zbE2MQ_Vs486Pz9L-I48wJqxkcVrsY';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
