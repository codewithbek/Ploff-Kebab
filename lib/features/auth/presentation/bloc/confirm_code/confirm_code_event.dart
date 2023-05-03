part of 'confirm_code_bloc.dart';

enum ConfirmStatus {
  login,
  register,
}

abstract class ConfirmCodeEvent extends Equatable {
  const ConfirmCodeEvent();
}

class PinCodeEvent extends ConfirmCodeEvent {
  final String code;
  final String phone;
  final ConfirmStatus status;

  const PinCodeEvent({
    required this.code,
    required this.phone,
    required this.status,
  });
  @override
  List<Object?> get props => [
        code,
        phone,
        status,
      ];
}
