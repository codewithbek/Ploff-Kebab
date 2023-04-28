import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';

class ConfirmResponseModel {
  const ConfirmResponseModel({
    this.id,
    this.name,
    this.phone,
    this.accessToken,
    this.refreshToken,
    this.createdAt,
    this.updatedAt,
    this.isBlocked,
  });

  factory ConfirmResponseModel.fromJson(dynamic json) {
    return ConfirmResponseModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isBlocked: json['is_blocked'],
    );
  }

  final String? id;
  final String? name;
  final String? phone;
  final String? accessToken;
  final String? refreshToken;
  final String? createdAt;
  final String? updatedAt;
  final bool? isBlocked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    map['careated_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_blocked'] = isBlocked;

    return map;
  }
}

extension ConfirmResponseModelX on ConfirmResponseModel {
  ConfirmResponseEntity toEntity() {
    return ConfirmResponseEntity(
        id: id,
        name: name,
        phone: phone,
        accessToken: accessToken,
        refreshToken: refreshToken,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isBlocked: isBlocked);
  }
}
