import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/use_cases/use_case.dart';

class GetAuthenticatedUserUseCase
    extends UseCase<AuthenticatedUserEntity, NoParams> {
  final AuthRepository repository;

  GetAuthenticatedUserUseCase(this.repository);

  @override
  Future<AuthenticatedUserEntity> call(NoParams params) {
    return repository.authenticatedUser;
  }
}
