import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'confirm_register_event.dart';
part 'confirm_register_state.dart';

class ConfirmRegisterBloc extends Bloc<ConfirmRegisterEvent, ConfirmRegisterState> {
  ConfirmRegisterBloc() : super(ConfirmRegisterInitial()) {
    on<ConfirmRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
