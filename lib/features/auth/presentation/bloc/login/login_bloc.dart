import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_kebab/core/mixins/cache_mixin.dart';

import '../../../domain/usecases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with CacheMixin {
  final LoginUseCase signIn;

  LoginBloc({required this.signIn}) : super(const LoginPhoneNumberState()) {
    on<LoginEnterPhoneNumberEvent>(_enterPhoneNumberHandler);
  }

  void _enterPhoneNumberHandler(
    LoginEnterPhoneNumberEvent event,
    Emitter<LoginState> emit,
  ) {
    var newState = state as LoginPhoneNumberState;
    emit(
      newState.copyWith(phone: event.phone),
    );
  }
}
