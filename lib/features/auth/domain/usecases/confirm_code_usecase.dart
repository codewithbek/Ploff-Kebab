import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';

class ConfirmCodeUseCase
    extends UseCase<ConfirmResponseEntity, ConfirmCodeParams> {
  final AuthRepository authRepository;

  ConfirmCodeUseCase(this.authRepository);

  @override
  Future<Either<Failure, ConfirmResponseEntity>> call(
      ConfirmCodeParams params) async {
    final response = await authRepository.confirmCode(
      params.confirmLoginRequestEntity,
      params.status,
    );
    return response;
  }
}

class ConfirmCodeParams extends Equatable {
  final ConfirmRequestEntity confirmLoginRequestEntity;
  final ConfirmStatus status;

  const ConfirmCodeParams(
    this.confirmLoginRequestEntity,
    this.status,
  );

  @override
  List<Object?> get props => [
        confirmLoginRequestEntity,
        status,
      ];
}
