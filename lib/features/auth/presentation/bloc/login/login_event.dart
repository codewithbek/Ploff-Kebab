part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEnterPhoneNumberEvent extends LoginEvent {
  final String phone;
  final String tag;

  const LoginEnterPhoneNumberEvent({
    required this.phone,
    required this.tag,
  });

  @override
  List<Object?> get props => [
        phone,
        tag,
      ];
}
