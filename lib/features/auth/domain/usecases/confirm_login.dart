import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';

class ConfirmLogin extends UseCase<ConfirmResponseEntity, Params> {
  final AuthRepository authRepository;

  ConfirmLogin(this.authRepository);

  @override
  Future<Either<Failure, ConfirmResponseEntity>> call(Params params) async {
    final response =
        await authRepository.confirmLogin(params.confirmLoginRequestEntity);
    return response;
  }
}

class Params extends Equatable {
  final ConfirmRequestEntity confirmLoginRequestEntity;

  const Params({required this.confirmLoginRequestEntity});

  @override
  List<Object?> get props => [confirmLoginRequestEntity];
}
