import 'package:ploff_kebab/features/auth/domain/entities/login/login_request_entity.dart';

class LoginRequestModel {
  const LoginRequestModel({
    this.phone,
    this.tag,
  });

  factory LoginRequestModel.fromJson(dynamic json) {
    return LoginRequestModel(
      phone: json['phone'],
      tag: json['tag'],
    );
  }

  final String? phone;
  final String? tag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['tag'] = tag;
    return map;
  }
}

extension SignInRequestModelX on LoginRequestModel {
  LoginRequestEntity toEntity() => LoginRequestEntity(
        phone: phone,
        tag: tag,
      );
}
