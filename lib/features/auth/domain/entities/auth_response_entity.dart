
import 'package:equatable/equatable.dart';

class AuthMessageResponseEntity extends Equatable {
  final String? message;

  const AuthMessageResponseEntity({required this.message});

  @override
  List<Object?> get props => [message];
}
