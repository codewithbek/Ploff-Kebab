part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String phone;
  final String registrationSource;
  final String tag;

  const RegisterButtonPressed({
    required this.name,
    required this.phone,
    required this.registrationSource,
    required this.tag,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        registrationSource,
        tag,
      ];
}
