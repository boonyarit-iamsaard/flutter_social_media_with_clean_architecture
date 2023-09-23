import 'package:flutter_social_media_with_clean_architecture/src/features/auth/data/data_sources/local/mock_auth_data_source.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Stream<AuthenticationStatus> get authenticationStatus;

  Future<AuthenticatedUserEntity> get authenticatedUser;

  Future<void> register({required AuthenticatedUserEntity user});

  Future<void> login({
    required Username username,
    required Password password,
  });

  Future<void> logout();
}
