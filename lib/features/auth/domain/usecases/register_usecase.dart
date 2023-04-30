import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/export_files.dart';

class RegisterUseCase extends UseCase<AuthMessageResponseEntity, Params> {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthMessageResponseEntity>> call(Params params) async {
    final response = await authRepository.register(params.signUpRequestEntity);
    return response;
  }
}

class Params extends Equatable {
  final RegisterRequestEntity signUpRequestEntity;

  const Params(this.signUpRequestEntity);

  @override
  List<Object?> get props => [signUpRequestEntity];
}
