import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_login_usecase.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  final ConfirmLoginUseCase confirmCode;
  ConfirmCodeBloc({
    required this.confirmCode,
  }) : super(const ConfirmCodeState(
          status: FormzSubmissionStatus.initial,
        )) {
    on<PinCodeEvent>(_loginConfirmCode);
  }

  void _loginConfirmCode(
      PinCodeEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeState(
      status: FormzSubmissionStatus.inProgress,
    ));
    final request = ConfirmRequestEntity(
      phone: event.phone,
      fcmToken: "",
      code: event.code,
    );
    final response = await confirmCode(ConfirmLoginParams(
      request,
      event.status,
    ));
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
        localSource.setProfile(true);
      },
    );
  }
}
