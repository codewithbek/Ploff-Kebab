
import 'package:ploff_kebab/export_files.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<AuthMessageResponseEntity, Params> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthMessageResponseEntity>> call(Params params) async {
    final response = await authRepository.login(params.signInRequestEntity);
    return response;
  }
}

class Params extends Equatable {
  final LoginRequestEntity signInRequestEntity;

  const Params({required this.signInRequestEntity});

  @override
  List<Object?> get props => [signInRequestEntity];
}
