import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_response_entity.dart';

class PhoneResponseModel {
  const PhoneResponseModel({
    this.id,
    this.name,
    this.phone,
    this.fcmToken,
    this.registrationSource,
    this.createdAt,
    this.updatedAt,
    this.isBlocked,
    this.tgChatId,
  });

  factory PhoneResponseModel.fromJson(dynamic json) {
    return PhoneResponseModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        fcmToken: json['fcm_token'],
        registrationSource: json['registration_source'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        isBlocked: json['is_blocked'],
        tgChatId: json['tg_chat_id']);
  }

  final String? id;
  final String? name;
  final String? phone;
  final String? fcmToken;
  final String? registrationSource;
  final String? createdAt;
  final String? updatedAt;
  final bool? isBlocked;
  final String? tgChatId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['fcm_token'] = fcmToken;
    map['registration_source'] = registrationSource;
    map['careated_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_blocked'] = isBlocked;
    map['tg_chat_id'] = tgChatId;
    return map;
  }
}

extension PhoneResponseModelX on PhoneResponseModel {
  PhoneResponseEntity toEntity() {
    return PhoneResponseEntity(
        id: id,
        name: name,
        phone: phone,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isBlocked: isBlocked,
        fcmToken: fcmToken,
        registrationSource: registrationSource,
        tgChatId: tgChatId);
  }
}
