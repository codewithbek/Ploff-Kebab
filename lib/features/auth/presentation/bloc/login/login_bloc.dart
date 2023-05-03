import 'package:ploff_kebab/core/error/exceptions.dart';
import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_login_usecase.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/login_usecase.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/send_phone_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with CacheMixin {
  final SendPhoneUseCase sendPhone;
  final LoginUseCase login;

  LoginBloc({
    required this.sendPhone,
    required this.login,
  }) : super(const LoginState(status: FormzSubmissionStatus.initial)) {
    on<LoginSendPhoneNumberEvent>(_sendPhoneNumber);
    on<UserLoginEvent>(_userLogin);
  }

  void _sendPhoneNumber(
    LoginSendPhoneNumberEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState(
      status: FormzSubmissionStatus.inProgress,
    ));
    final request = PhoneRequestEntity(phone: event.phone);
    final response = await sendPhone(SendPhoneParams(request));
    response.fold(
      (error) {
        if (error is ServerFailure) {
          if (error.message == "NOT_FOUND") {
            print("event.onError");
            event.onError();
          }
        }
      },
      (response) {
        emit(LoginState(
          status: FormzSubmissionStatus.success,
        ));
        event.onSucces();
      },
    );
    setUserPhoneNumber(phone: event.phone);
  }

  void _userLogin(
    UserLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState(status: FormzSubmissionStatus.inProgress));
    final request = LoginRequestEntity(phone: event.phone, tag: event.tag);
    final response = await login(LoginParams(request));
    response.fold(
      (error) {
        debugPrint(">>>>$error");
        debugPrint("Error");
        emit(
          LoginState(
            status: FormzSubmissionStatus.failure,
            message: (error is ServerFailure)
                ? error.message
                : Validations.INTERNET_FAILURE,
          ),
        );
      },
      (response) {
        debugPrint(">>>>$response");
        debugPrint("response");

        emit(
          const LoginState(
            status: FormzSubmissionStatus.success,
          ),
        );
      },
    );
  }
}
