import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';

class ConfirmLoginUseCase
    extends UseCase<ConfirmResponseEntity, ConfirmLoginParams> {
  final AuthRepository authRepository;

  ConfirmLoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, ConfirmResponseEntity>> call(
      ConfirmLoginParams params) async {
    final response = await authRepository.confirmCode(
      params.confirmLoginRequestEntity,
      params.status,
    );
    return response;
  }
}

class ConfirmLoginParams extends Equatable {
  final ConfirmRequestEntity confirmLoginRequestEntity;
  final ConfirmStatus status;

  const ConfirmLoginParams(
    this.confirmLoginRequestEntity,
    this.status,
  );

  @override
  List<Object?> get props => [
        confirmLoginRequestEntity,
        status,
      ];
}
