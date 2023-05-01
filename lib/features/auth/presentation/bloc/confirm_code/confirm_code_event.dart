part of 'confirm_code_bloc.dart';

abstract class ConfirmCodeEvent extends Equatable {
  const ConfirmCodeEvent();
}

class LoginConfirmCodeEvent extends ConfirmCodeEvent {
  final String code;
  final String phone;
  const LoginConfirmCodeEvent({
    required this.code,
    required this.phone,
  });
  @override
  List<Object?> get props => [code, phone];
}

class RegisterConfirmCodeEvent extends ConfirmCodeEvent {
  final String code;
  final String phone;
  const RegisterConfirmCodeEvent({
    required this.code,
    required this.phone,
  });
  @override
  List<Object?> get props => [
        code,
        phone,
      ];
}
