part of 'confirm_code_bloc.dart';

class ConfirmCodeState extends Equatable {
  final FormzSubmissionStatus status;
  final ConfirmStatus? userStatus;
  final String? message;
  const ConfirmCodeState({
    required this.status,
     this.userStatus,
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
        status,
      ];
}

