part of 'register_bloc.dart';

enum RegisterStatus { initial, loading, error, success }

 class RegisterState extends Equatable {
  final String? message;
  final RegisterInputsErrors? errors;
  final RegisterStatus status;

  const RegisterState({this.message, this.errors, required this.status});

  @override
  List<Object?> get props => [status, message, errors];

  RegisterState copyWith(
      {RegisterStatus? status, String? message, RegisterInputsErrors? errors}) {
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
