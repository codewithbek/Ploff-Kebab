import 'package:ploff_kebab/features/auth/domain/entities/register/register_request_entity.dart';

class RegisterRequestModel {
  const RegisterRequestModel({
    this.name,
    this.phone,
    this.registrationSource,
    this.tag,
  });

  factory RegisterRequestModel.fromJson(dynamic json) {
    return RegisterRequestModel(
      name: json['name'],
      phone: json['phone'],
      registrationSource: json['registration_source'],
      tag: json['tag'],
    );
  }

  final String? name;
  final String? phone;
  final String? registrationSource;
  final String? tag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['registration_source'] = registrationSource;
    map['tag'] = tag;
    return map;
  }
}

extension SignUpRequestModelX on RegisterRequestModel {
  RegisterRequestEntity toEntity() {
    return RegisterRequestEntity(
        name: name,
        phone: phone,
        registrationSource: registrationSource,
        tag: tag);
  }
}
