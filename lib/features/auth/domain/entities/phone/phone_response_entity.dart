import 'package:equatable/equatable.dart';

class PhoneResponseEntity extends Equatable {
  final String? id;
  final String? name;
  final String? phone;
  final String? fcmToken;
  final String? tgChatId;
  final String? createdAt;
  final String? updatedAt;
  final bool? isBlocked;
  final String? registrationSource;

  const PhoneResponseEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.fcmToken,
    required this.tgChatId,
    required this.createdAt,
    required this.isBlocked,
    required this.updatedAt,
    required this.registrationSource,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        fcmToken,
        tgChatId,
        createdAt,
        isBlocked,
        updatedAt,
        registrationSource
      ];
}
