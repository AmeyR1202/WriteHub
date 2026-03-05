import 'package:fpdart/fpdart.dart';
import 'package:writehub/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failures, String>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
