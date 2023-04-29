import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_phone_event.dart';
part 'send_phone_state.dart';

class SendPhoneBloc extends Bloc<SendPhoneEvent, SendPhoneState> {
  SendPhoneBloc() : super(SendPhoneInitial()) {
    on<SendPhoneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
