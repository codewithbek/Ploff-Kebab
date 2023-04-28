part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEnterPhoneNumberEvent extends LoginEvent {
  final String phoneNumber;

  const LoginEnterPhoneNumberEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginPhoneButtonPressedEvent extends LoginEvent {
  final String phoneNumber;

  const LoginPhoneButtonPressedEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginEnterCodeEvent extends LoginEvent {
  final String code;

  const LoginEnterCodeEvent({required this.code});

  @override
  List<Object?> get props => [code];
}

class LoginCodeButtonPressedEvent extends LoginEvent {
  final String code;

  const LoginCodeButtonPressedEvent({required this.code});

  @override
  List<Object?> get props => [code];
}
