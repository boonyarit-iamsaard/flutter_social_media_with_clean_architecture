import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/use_cases/use_case.dart';

class LoginUseCase extends UseCase<void, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<void> call(LoginParams params) {
    return repository.login(
      username: params.username,
      password: params.password,
    );
  }
}

class LoginParams extends Params {
  final Username username;
  final Password password;

  LoginParams({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
