import 'package:equatable/equatable.dart';

class LoginRequestEntity extends Equatable {
  final String? phone;
  final String? tag;

  const LoginRequestEntity({
    required this.phone,
    required this.tag,
  });

  @override
  List<Object?> get props => [
        phone,
        tag,
      ];
}
