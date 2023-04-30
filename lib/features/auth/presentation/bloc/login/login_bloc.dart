import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_kebab/core/mixins/cache_mixin.dart';

import '../../../domain/usecases/login.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, AuthLoginState> with CacheMixin {
  final LoginUseCase signIn;

  LoginBloc({required this.signIn}) : super(const LoginState()) {
    on<LoginEnterPhoneNumberEvent>(_enterPhoneNumberHandler);
  }

  void _enterPhoneNumberHandler(
    LoginEnterPhoneNumberEvent event,
    Emitter<AuthLoginState> emit,
  ) {
    var newState = state as LoginState;
    emit(
      newState.copyWith(phoneNumber: event.phoneNumber),
    );
  }

  void _phoneNumberPressedHandler(
    LoginPhoneButtonPressedEvent event,
    Emitter<AuthLoginState> emit,
  ) {
    emit(
      const LoginCodeState(),
    );
  }
}
