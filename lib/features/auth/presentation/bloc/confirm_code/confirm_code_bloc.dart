import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_login_usecase.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_register_usecase.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  final ConfirmLoginUseCase confirmLogin;
  final ConfirmRegisterUseCase confirmRegister;
  ConfirmCodeBloc({
    required this.confirmLogin,
    required this.confirmRegister,
  }) : super(const ConfirmCodeState(
          status: FormzSubmissionStatus.initial,
        )) {
    on<LoginConfirmCodeEvent>(_loginConfirmCode);
    on<RegisterConfirmCodeEvent>(_registerConfirmCode);
  }

  void _loginConfirmCode(
      LoginConfirmCodeEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeState(
      status: FormzSubmissionStatus.inProgress,
    ));
    final request = ConfirmRequestEntity(
      phone: localSource.getPhone(),
      fcmToken: "",
      code: event.code,
    );
    final response = await confirmLogin(ConfirmLoginParams(request));
    response.fold(
      (l) {
        emit(
          ConfirmCodeState(
            userStatus: ConfirmStatus.unauthenticated,
            status: FormzSubmissionStatus.failure,
            message: (l is ServerFailure)
                ? l.message
                : Validations.SOMETHING_WENT_WRONG,
          ),
        );
      },
      (r) {
        emit(
          const ConfirmCodeState(
            status: FormzSubmissionStatus.success,
            userStatus: ConfirmStatus.authenticated,
          ),
        );
      },
    );
  }

  void _registerConfirmCode(
      RegisterConfirmCodeEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeState(
        status: FormzSubmissionStatus.inProgress,
        userStatus: ConfirmStatus.unauthenticated));
    final request = ConfirmRequestEntity(
      phone: localSource.getPhone(),
      fcmToken: "",
      code: event.code,
    );
    final response = await confirmRegister(
        ConfirmRegisterParams(confirmRegisterRequestEntity: request));
    response.fold(
      (l) {
        emit(
          ConfirmCodeState(
            status: FormzSubmissionStatus.failure,
            message: (l is ServerFailure)
                ? l.message
                : Validations.SOMETHING_WENT_WRONG,
          ),
        );
      },
      (r) {
        emit(
          const ConfirmCodeState(
            status: FormzSubmissionStatus.success,
          ),
        );
      },
    );
  }
}
