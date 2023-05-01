part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String? message;
  final RegisterInputsErrors? errors;
  final FormzSubmissionStatus status;

  const RegisterState({this.message, this.errors, required this.status});

  @override
  List<Object?> get props => [status, message, errors];

  RegisterState copyWith(
      {FormzSubmissionStatus? status,
      String? message,
      RegisterInputsErrors? errors}) {
    return RegisterState(
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
    );
  }
}

enum RegisterInputsErrors {
  name,
  phone,
}
