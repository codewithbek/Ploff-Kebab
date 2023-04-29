import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'confirm_login_event.dart';
part 'confirm_login_state.dart';

class ConfirmLoginBloc extends Bloc<ConfirmLoginEvent, ConfirmLoginState> {
  ConfirmLoginBloc() : super(ConfirmLoginInitial()) {
    on<ConfirmLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
