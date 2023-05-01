import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<AuthMessageResponseEntity, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthMessageResponseEntity>> call(
      LoginParams params) async {
    final response = await authRepository.login(params.loginRequestEntity);
    return response;
  }
}

class LoginParams extends Equatable {
  final LoginRequestEntity loginRequestEntity;

  const LoginParams(this.loginRequestEntity);

  @override
  List<Object?> get props => [loginRequestEntity];
}
