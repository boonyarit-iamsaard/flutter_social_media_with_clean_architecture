import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/use_cases/use_case.dart';

class RegisterUseCase extends UseCase<void, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<void> call(RegisterParams params) {
    return repository.register(
      user: params.user,
    );
  }
}

class RegisterParams extends Params {
  final AuthenticatedUserEntity user;

  RegisterParams({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}
