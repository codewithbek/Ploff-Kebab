part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;

  bool get isLoading => this == LoginStatus.loading;

  bool get isSuccess => this == LoginStatus.success;

  bool get isError => this == LoginStatus.error;
}

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginSendPhoneNumberState extends LoginState {
  final String phone;
  final LoginStatus status;
  final String message;
  const LoginSendPhoneNumberState({
    this.phone = '',
    this.message = '',
    this.status = LoginStatus.initial,
  });

  LoginSendPhoneNumberState copyWith({
    String? phone,
    String? tag,
    String? message,
    LoginStatus? status,
  }) {
    return LoginSendPhoneNumberState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        status,
        message,
      ];
}

class UserLoginState extends LoginState {
  final String phone;
  final String tag;
  final LoginStatus status;
  final String message;
  const UserLoginState({
    this.phone = '',
    this.tag = '',
    this.message = '',
    this.status = LoginStatus.initial,
  });

  UserLoginState copyWith({
    String? phone,
    String? tag,
    String? message,
    LoginStatus? status,
  }) {
    return UserLoginState(
      phone: phone ?? this.phone,
      tag: tag ?? this.tag,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        tag,
        status,
        message,
      ];
}
