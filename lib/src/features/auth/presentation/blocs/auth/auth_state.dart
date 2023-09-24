part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus authenticationStatus;
  final AuthenticatedUserEntity authenticatedUser;

  const AuthState._({
    this.authenticationStatus = AuthenticationStatus.unknown,
    this.authenticatedUser = AuthenticatedUserEntity.empty,
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated({required AuthenticatedUserEntity user})
      : this._(
          authenticationStatus: AuthenticationStatus.authenticated,
          authenticatedUser: user,
        );

  const AuthState.unauthenticated()
      : this._(authenticationStatus: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [authenticationStatus, authenticatedUser];
}
