import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class UserEntity extends Equatable {
  final String id;
  final Username username;
  final int followers;
  final int following;
  final String? imagePath;

  const UserEntity({
    required this.id,
    required this.username,
    this.followers = 0,
    this.following = 0,
    this.imagePath,
  });

  static empty() => const UserEntity(
        id: 'user_0',
        username: Username.pure(),
      );

  @override
  List<Object?> get props => [
        id,
        username,
        followers,
        following,
        imagePath,
      ];
}

enum UsernameValidationError { invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([String value = '']) : super.dirty(value);

  static final _usernameRegExp = RegExp(
    r'^[a-zA-Z0-9_]+$',
  );

  @override
  UsernameValidationError? validator(value) {
    return _usernameRegExp.hasMatch(value)
        ? null
        : UsernameValidationError.invalid;
  }
}
