import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/use_cases/use_case.dart';

class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<void> call(NoParams params) {
    return repository.logout();
  }
}
