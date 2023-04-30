part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginPhoneNumberState extends LoginState {
  final String phone;
  final String tag;
  final LoginStatus status;
  final String message;
  const LoginPhoneNumberState({
    this.phone = '',
    this.tag = '',
    this.message = '',
    this.status = LoginStatus.initial,
  });

  LoginPhoneNumberState copyWith({
    String? phone,
    String? tag,
    String? message,
    LoginStatus? status,
  }) {
    return LoginPhoneNumberState(
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

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;

  bool get isLoading => this == LoginStatus.loading;

  bool get isSuccess => this == LoginStatus.success;

  bool get isError => this == LoginStatus.error;
}
