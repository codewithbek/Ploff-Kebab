part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSendPhoneNumberEvent extends LoginEvent {
  final String phone;
  final VoidCallback onSucces;
  final VoidCallback onError;
  const LoginSendPhoneNumberEvent({
    required this.phone,
    required this.onError,
    required this.onSucces,
  });

  @override
  List<Object?> get props => [
        phone,
        onError,
        onSucces,
      ];
}

class UserLoginEvent extends LoginEvent {
  final String phone;
  final String tag;

  const UserLoginEvent({
    required this.phone,
    required this.tag,
  });

  @override
  List<Object?> get props => [
        phone,
        tag,
      ];
}
