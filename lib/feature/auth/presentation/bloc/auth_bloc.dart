import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:writehub/feature/auth/domain/entities/user_entity.dart';
import 'package:writehub/feature/auth/domain/usecases/user_sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpUsecase _userSignUpUsecase;

  AuthBloc({required UserSignUpUsecase userSignUpUsecase})
    : _userSignUpUsecase = userSignUpUsecase,
      super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUpUsecase(
        UserSignUpParams(
          email: event.email,
          name: event.name,
          password: event.password,
        ),
      );
      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(AuthSuccess(user)),
      );
    });
  }
}
