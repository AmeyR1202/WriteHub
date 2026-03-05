import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:writehub/core/secrets/supabase_secrets.dart';
import 'package:writehub/feature/auth/data/datasources/auth_supabase_data_source.dart';
import 'package:writehub/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:writehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:writehub/feature/auth/domain/usecases/user_sign_up_usecase.dart';
import 'package:writehub/feature/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: SupabaseSecrets.supabaseUrl,
    anonKey: SupabaseSecrets.supabaseAnonKey,
  );
  sl.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  sl.registerFactory<AuthSupabaseDataSource>(
    () => AuthSupabaseDataSourceImpl(sl()),
  );
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerFactory(() => UserSignUpUsecase(sl()));
  sl.registerLazySingleton(() => AuthBloc(userSignUpUsecase: sl()));
}
