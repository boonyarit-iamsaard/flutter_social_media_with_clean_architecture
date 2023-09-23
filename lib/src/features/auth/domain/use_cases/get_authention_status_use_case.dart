import 'package:flutter_social_media_with_clean_architecture/src/features/auth/data/data_sources/local/mock_auth_data_source.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/use_cases/use_case.dart';

class GetAuthenticationStatusUseCase
    extends UseCase<AuthenticationStatus, NoParams> {
  final AuthRepository repository;

  GetAuthenticationStatusUseCase(this.repository);

  @override
  Stream<AuthenticationStatus> call(NoParams params) {
    return repository.authenticationStatus;
  }
}
