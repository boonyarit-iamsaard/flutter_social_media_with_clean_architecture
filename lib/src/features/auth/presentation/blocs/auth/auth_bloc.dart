import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/data/data_sources/local/mock_auth_data_source.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/get_authenticated_user_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/get_authentication_status_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/use_cases/use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUseCase _logoutUseCase;
  final GetAuthenticationStatusUseCase _getAuthenticationStatusUseCase;
  final GetAuthenticatedUserUseCase _getAuthenticatedUserUseCase;

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  AuthBloc({
    required LogoutUseCase logoutUseCase,
    required GetAuthenticationStatusUseCase getAuthenticationStatusUseCase,
    required GetAuthenticatedUserUseCase getAuthenticatedUserUseCase,
  })  : _logoutUseCase = logoutUseCase,
        _getAuthenticationStatusUseCase = getAuthenticationStatusUseCase,
        _getAuthenticatedUserUseCase = getAuthenticatedUserUseCase,
        super(const AuthState.unknown()) {
    on<GetAuthenticationStatusEvent>(_onGetAuthenticationStatusEvent);
    on<LogoutEvent>(_onLogoutEvent);

    _authenticationStatusSubscription =
        _getAuthenticationStatusUseCase(NoParams())
            .listen((authenticationStatus) {
      add(GetAuthenticationStatusEvent(
        authenticationStatus: authenticationStatus,
      ));
    });
  }

  Future<void> _onGetAuthenticationStatusEvent(
    GetAuthenticationStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    debugPrint(
      'AuthBloc: _onGetAuthenticationStatusEvent - $event.authenticationStatus',
    );

    switch (event.authenticationStatus) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final authenticatedUser =
            await _getAuthenticatedUserUseCase(NoParams());

        return emit(AuthState.authenticated(user: authenticatedUser));
      default:
        return emit(const AuthState.unknown());
    }
  }

  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    debugPrint('AuthBloc: _onSignOutEvent');

    await _logoutUseCase(NoParams());
    emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }
}
