import 'package:flutter_social_media_with_clean_architecture/src/features/auth/data/data_sources/local/mock_auth_data_source.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user_entity.dart';

class AuthRepositoryImpl extends AuthRepository {
  final MockAuthDataSource _mockAuthDataSource;

  AuthRepositoryImpl(this._mockAuthDataSource);

  @override
  Stream<AuthenticationStatus> get authenticationStatus =>
      _mockAuthDataSource.authenticationStatus;

  @override
  Future<AuthenticatedUserEntity> get authenticatedUser =>
      _mockAuthDataSource.authenticatedUser;

  @override
  Future<void> login({
    required Username username,
    required Password password,
  }) {
    return _mockAuthDataSource.login(
      username: username,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return _mockAuthDataSource.logout();
  }

  @override
  Future<void> register({required AuthenticatedUserEntity user}) {
    return _mockAuthDataSource.register(user: user);
  }
}
