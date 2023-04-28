import 'package:equatable/equatable.dart';

class ConfirmResponseEntity extends Equatable {
  final String? id;
  final String? name;
  final String? phone;
  final String? accessToken;
  final String? refreshToken;
  final String? createdAt;
  final String? updatedAt;
  final bool? isBlocked;

  const ConfirmResponseEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.accessToken,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.isBlocked,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        accessToken,
        refreshToken,
        isBlocked,
        updatedAt,
        createdAt,
      ];
}
