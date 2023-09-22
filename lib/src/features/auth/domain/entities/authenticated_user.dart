import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user.dart';
import 'package:formz/formz.dart';

class AuthenticatedUserEntity extends UserEntity {
  const AuthenticatedUserEntity({
    required super.id,
    required super.username,
    super.followers,
    super.following,
    super.imagePath,
    this.email,
  });

  final Email? email;

  static empty() => const AuthenticatedUserEntity(
        id: 'user_0',
        username: Username.pure(),
        email: Email.pure(),
      );

  @override
  List<Object?> get props => [
        id,
        username,
        followers,
        following,
        imagePath,
        email,
      ];

  AuthenticatedUserEntity copyWith({
    String? id,
    Username? username,
    int? followers,
    int? following,
    String? imagePath,
    Email? email,
  }) {
    return AuthenticatedUserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      imagePath: imagePath ?? this.imagePath,
      email: email ?? this.email,
    );
  }
}

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  EmailValidationError? validator(value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  PasswordValidationError? validator(value) {
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
