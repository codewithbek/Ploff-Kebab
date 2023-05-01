import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_request_entity.dart';
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
  }) : super(const LoginSendPhoneNumberState()) {
    on<LoginSendPhoneNumberEvent>(_sendPhoneNumber);
  }

  void _sendPhoneNumber(
    LoginSendPhoneNumberEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginSendPhoneNumberState(status: LoginStatus.loading));
    final request = PhoneRequestEntity(phone: event.phone);
    final response = await sendPhone(SendPhoneParams(request));
    response.fold(
      (error) {
        setUserPhoneNumber(phone: event.phone);
        emit(
          LoginSendPhoneNumberState(
            status: LoginStatus.error,
            message: (error is ServerFailure)
                ? error.message
                : Validations.INTERNET_FAILURE,
          ),
        );
      },
      (response) {
        emit(
          const LoginSendPhoneNumberState(status: LoginStatus.success),
        );
      },
    );
  }
}
