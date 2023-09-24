part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetAuthenticationStatusEvent extends AuthEvent {
  final AuthenticationStatus authenticationStatus;

  const GetAuthenticationStatusEvent({required this.authenticationStatus});

  @override
  List<Object> get props => [authenticationStatus];
}

class SignOutEvent extends AuthEvent {}
