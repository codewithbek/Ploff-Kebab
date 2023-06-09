import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/export_files.dart';

class RegisterUseCase
    extends UseCase<AuthMessageResponseEntity, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthMessageResponseEntity>> call(
      RegisterParams params) async {
    final response = await authRepository.register(params.signUpRequestEntity);
    return response;
  }
}

class RegisterParams extends Equatable {
  final RegisterRequestEntity signUpRequestEntity;

  const RegisterParams(this.signUpRequestEntity);

  @override
  List<Object?> get props => [signUpRequestEntity];
}
