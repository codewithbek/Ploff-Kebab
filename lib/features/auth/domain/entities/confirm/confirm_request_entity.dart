import 'package:equatable/equatable.dart';

class ConfirmRequestEntity extends Equatable {
  final String? phone;
  final String? fcmToken;
  final String? code;

  const ConfirmRequestEntity({
    required this.phone,
    required this.fcmToken,
    required this.code,
  });

  @override
  List<Object?> get props => [
        phone,
        fcmToken,
        code,
      ];
}
