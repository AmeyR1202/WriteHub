import 'package:fpdart/fpdart.dart';
import 'package:writehub/core/error/failures.dart';
import 'package:writehub/core/usecase/usecase.dart';
import 'package:writehub/feature/auth/domain/repository/auth_repository.dart';

class UserSignUpUsecase implements Usecase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUpUsecase(this.authRepository);

  @override
  Future<Either<Failures, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String name;
  final String password;

  UserSignUpParams({
    required this.email,
    required this.name,
    required this.password,
  });
}
