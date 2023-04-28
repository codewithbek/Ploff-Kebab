import 'package:ploff_kebab/features/auth/domain/entities/auth_response_entity.dart';

class AuthMessageResponseModel {
  const AuthMessageResponseModel({
    this.message,
  });

  factory AuthMessageResponseModel.fromJson(dynamic json) {
    return AuthMessageResponseModel(
      message: json['message'],
    );
  }

  final String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}

extension AuthResponseModelExtension on AuthMessageResponseModel {
  AuthMessageResponseEntity toEntity() {
    return AuthMessageResponseEntity(
      message: message,
    );
  }
}
