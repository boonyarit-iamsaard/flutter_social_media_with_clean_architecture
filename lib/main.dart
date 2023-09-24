import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_with_clean_architecture/src/config/app_router.dart';
import 'package:flutter_social_media_with_clean_architecture/src/config/app_theme.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/data/data_sources/local/mock_auth_data_source.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/get_authenticated_user_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/get_authentication_status_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/presentation/blocs/login/login_cubit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepositoryImpl(
            MockAuthDataSourceImpl(cache: CacheClient()),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              getAuthenticationStatusUseCase: GetAuthenticationStatusUseCase(
                context.read<AuthRepositoryImpl>(),
              ),
              getAuthenticatedUserUseCase: GetAuthenticatedUserUseCase(
                context.read<AuthRepositoryImpl>(),
              ),
              logoutUseCase: LogoutUseCase(
                context.read<AuthRepositoryImpl>(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              loginUseCase: LoginUseCase(
                context.read<AuthRepositoryImpl>(),
              ),
            ),
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Social Media App with Clean Architecture',
            theme: AppTheme().theme(),
            routerConfig: AppRouter(context.read<AuthBloc>()).router,
          );
        }),
      ),
    );
  }
}
