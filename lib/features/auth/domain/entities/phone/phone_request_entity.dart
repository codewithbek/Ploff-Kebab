import 'package:equatable/equatable.dart';

class PhoneRequestEntity extends Equatable {
  final String? phone;

  const PhoneRequestEntity({
    required this.phone,
  });

  @override
  List<Object?> get props => [
        phone,
      ];
}
