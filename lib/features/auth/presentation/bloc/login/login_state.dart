part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? message;
  final FormzSubmissionStatus status;

  final VoidCallback? onSucces;
  final VoidCallback? onError;
  const LoginState({
    this.message,
    this.onError,
    this.onSucces,
    required this.status,
  });

  @override
  List<Object?> get props => [
        message,
        status,
        onError,
        onSucces,
      ];
}
