import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_response_entity.dart';

class SendPhoneUseCase extends UseCase<PhoneResponseEntity, SendPhoneParams> {
  final AuthRepository authRepository;

  SendPhoneUseCase(this.authRepository);

  @override
  Future<Either<Failure, PhoneResponseEntity>> call(
      SendPhoneParams params) async {
    final response = await authRepository.sendPhone(params.phoneRequestEntity);
    return response;
  }
}

class SendPhoneParams extends Equatable {
  final PhoneRequestEntity phoneRequestEntity;

  const SendPhoneParams(this.phoneRequestEntity);

  @override
  List<Object?> get props => [phoneRequestEntity];
}
