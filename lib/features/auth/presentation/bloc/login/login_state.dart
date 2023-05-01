part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? message;
  final FormzSubmissionStatus status;
  final UserAuthStatus? userStatus;

  const LoginState({
    this.message,
    required this.status,
    this.userStatus,
  });

  @override
  List<Object?> get props => [
        message,
        status,
        userStatus,
      ];
}

enum UserAuthStatus { uninitialized, authenticated, unauthenticated }
