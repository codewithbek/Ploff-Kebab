import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_request_entity.dart';

class PhoneRequestModel {
  const PhoneRequestModel({
    this.phone,
  });

  factory PhoneRequestModel.fromJson(dynamic json) {
    return PhoneRequestModel(
      phone: json['phone'],
    );
  }

  final String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    return map;
  }
}

extension PhoneRequestModelX on PhoneRequestModel {
  PhoneRequestEntity toEntity() {
    return PhoneRequestEntity(
      phone: phone,
    );
  }
}
