import 'package:fpdart/fpdart.dart';
import 'package:writehub/core/error/failures.dart';
import 'package:writehub/feature/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failures, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
