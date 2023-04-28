import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_response_entity.dart';

class CustomerPhone extends UseCase<PhoneResponseEntity, Params> {
  final AuthRepository authRepository;

  CustomerPhone(this.authRepository);

  @override
  Future<Either<Failure, PhoneResponseEntity>> call(Params params) async {
    final response =
        await authRepository.customerPhone(params.phoneRequestEntity);
    return response;
  }
}

class Params extends Equatable {
  final PhoneRequestEntity phoneRequestEntity;

  const Params({required this.phoneRequestEntity});

  @override
  List<Object?> get props => [phoneRequestEntity];
}
