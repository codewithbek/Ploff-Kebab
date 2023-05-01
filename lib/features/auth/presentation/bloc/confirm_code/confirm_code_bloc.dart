import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  ConfirmCodeBloc() : super(ConfirmCodeInitial()) {
    on<ConfirmCodeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
