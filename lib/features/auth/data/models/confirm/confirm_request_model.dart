import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';

class ConfirmRequestModel {
  const ConfirmRequestModel({
    this.fcmToken,
    this.phone,
    this.code,
  });

  factory ConfirmRequestModel.fromJson(dynamic json) {
    return ConfirmRequestModel(
      fcmToken: json['fcm_token'],
      phone: json['phone'],
      code: json['code'],
    );
  }

  final String? fcmToken;
  final String? phone;
  final String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fcm_token'] = fcmToken;
    map['phone'] = phone;
    map['code'] = code;
    return map;
  }
}

extension ConfirmRequestModelX on ConfirmRequestModel {
  ConfirmRequestEntity toEntity() {
    return ConfirmRequestEntity(
      phone: phone,
      fcmToken: fcmToken,
      code: code,
    );
  }
}
