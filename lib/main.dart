import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:writehub/core/router/app_router.dart';
import 'package:writehub/core/secrets/supabase_secrets.dart';
import 'package:writehub/core/theme/theme.dart';
import 'package:writehub/feature/auth/data/datasources/auth_supabase_data_source.dart';
import 'package:writehub/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:writehub/feature/auth/domain/usecases/user_sign_up_usecase.dart';
import 'package:writehub/feature/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: SupabaseSecrets.supabaseUrl,
    anonKey: SupabaseSecrets.supabaseAnonKey,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUpUsecase: UserSignUpUsecase(
              AuthRepositoryImpl(AuthSupabaseDataSourceImpl(supabase.client)),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Write Hub',
      theme: AppTheme.darkThemeMode,
      routerConfig: appRouter,
    );
  }
}
