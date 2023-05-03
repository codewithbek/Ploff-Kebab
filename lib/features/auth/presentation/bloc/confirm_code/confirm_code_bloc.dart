import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_code_usecase.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  final ConfirmCodeUseCase confirmCode;
  ConfirmCodeBloc({
    required this.confirmCode,
  }) : super(const ConfirmCodeState(
          status: FormzSubmissionStatus.initial,
        )) {
    on<PinCodeEvent>(_confirmCode);
  }

  void _confirmCode(PinCodeEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeState(
      status: FormzSubmissionStatus.inProgress,
    ));
    final request = ConfirmRequestEntity(
      phone: event.phone,
      fcmToken: "",
      code: event.code,
    );
    final response = await confirmCode(ConfirmCodeParams(
      request,
      event.status,
    ));
    response.fold(
      (error) {
        debugPrint(">>>>$error");
        debugPrint("Error");
        // if (error is ServerFailure) {
        //   if (error.message == "NOT_FOUND") {
        //     event.onError();
        //   }
        // }
        emit(
          ConfirmCodeState(
            status: FormzSubmissionStatus.failure,
            message: (error is ServerFailure)
                ? error.message
                : Validations.INTERNET_FAILURE,
          ),
        );
        event.onError();
      },
      (response) {
        debugPrint("response");
        emit(
          const ConfirmCodeState(
            status: FormzSubmissionStatus.success,
          ),
        );
        event.onSucces();
        setUserInfo(
          name: response.name ?? "",
          phone: response.phone ?? "",
          accessToken: response.accessToken ?? "",
          refreshToken: response.refreshToken ?? "",
        );
        localSource.setProfile(true);
      },
    );
  }
}
