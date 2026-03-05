import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:writehub/core/error/exceptions.dart';

abstract interface class AuthSupabaseDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthSupabaseDataSourceImpl implements AuthSupabaseDataSource {
  final SupabaseClient supabaseClient;
  AuthSupabaseDataSourceImpl(this.supabaseClient);

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );
      if (response.user == null) {
        throw ServerExceptions('User was found to be null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
