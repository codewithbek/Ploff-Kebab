part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? message;
  final FormzSubmissionStatus status;


  const LoginState({
    this.message,

    required this.status,
  });

  @override
  List<Object?> get props => [
        message,
        status,
       
      ];
}
