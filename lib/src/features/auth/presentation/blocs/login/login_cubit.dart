import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user_entity.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit({
    required LoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(LoginState.initial());

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        validInputs: Formz.validate([
          username,
          state.password,
        ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        validInputs: Formz.validate([
          state.username,
          password,
        ]),
      ),
    );
  }

  Future<void> login() async {
    if (state.validInputs == false) return;

    emit(
      state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress),
    );

    try {
      await _loginUseCase(
        LoginParams(
          username: state.username,
          password: state.password,
        ),
      );

      emit(
        state.copyWith(submissionStatus: FormzSubmissionStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(
          submissionStatus: FormzSubmissionStatus.failure,
          validInputs: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
