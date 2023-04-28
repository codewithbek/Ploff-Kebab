import 'package:equatable/equatable.dart';

class RegisterRequestEntity extends Equatable {
  final String? name;
  final String? phone;
  final String? registrationSource;
  final String? tag;

  const RegisterRequestEntity({
     this.name,
     this.phone,
     this.registrationSource,
     this.tag,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        registrationSource,
        tag,
      ];
}
