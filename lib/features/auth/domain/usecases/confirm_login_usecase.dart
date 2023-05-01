import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';

class ConfirmLoginUseCase
    extends UseCase<ConfirmResponseEntity, ConfirmLoginParams> {
  final AuthRepository authRepository;

  ConfirmLoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, ConfirmResponseEntity>> call(
      ConfirmLoginParams params) async {
    final response =
        await authRepository.confirmLogin(params.confirmLoginRequestEntity);
    return response;
  }
}

class ConfirmLoginParams extends Equatable {
  final ConfirmRequestEntity confirmLoginRequestEntity;

  const ConfirmLoginParams(this.confirmLoginRequestEntity);

  @override
  List<Object?> get props => [confirmLoginRequestEntity];
}
