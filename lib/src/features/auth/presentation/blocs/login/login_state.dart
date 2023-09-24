part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Username username;
  final Password password;
  final FormzSubmissionStatus submissionStatus;
  final bool? validInputs;
  final String? errorMessage;

  const LoginState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.validInputs,
    this.errorMessage,
  });

  factory LoginState.initial() {
    return const LoginState(
      username: Username.pure(),
      password: Password.pure(),
      submissionStatus: FormzSubmissionStatus.initial,
      validInputs: null,
      errorMessage: null,
    );
  }

  LoginState copyWith({
    Username? username,
    Password? password,
    FormzSubmissionStatus? submissionStatus,
    bool? validInputs,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      validInputs: validInputs ?? this.validInputs,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        submissionStatus,
        validInputs,
        errorMessage,
      ];
}
