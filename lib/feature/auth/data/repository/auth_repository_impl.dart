import 'package:writehub/core/error/exceptions.dart';
import 'package:writehub/core/error/failures.dart';
import 'package:writehub/feature/auth/data/datasources/auth_supabase_data_source.dart';
import 'package:writehub/feature/auth/domain/entities/user_entity.dart';
import 'package:writehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSupabaseDataSource supabaseDataSource;
  AuthRepositoryImpl(this.supabaseDataSource);

  @override
  Future<Either<Failures, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabaseDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerExceptions catch (e) {
      return left(Failures(e.message));
    }
  }
}
