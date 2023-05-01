
import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';

class ConfirmRegisterUseCase extends UseCase<ConfirmResponseEntity, ConfirmRegisterParams> {
  final AuthRepository authRepository;

  ConfirmRegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, ConfirmResponseEntity>> call(ConfirmRegisterParams params) async {
    final response = await authRepository
        .confirmRegister(params.confirmRegisterRequestEntity);
    return response;
  }
}

class ConfirmRegisterParams extends Equatable {
  final ConfirmRequestEntity confirmRegisterRequestEntity;

  const ConfirmRegisterParams({required this.confirmRegisterRequestEntity});

  @override
  List<Object?> get props => [confirmRegisterRequestEntity];
}
