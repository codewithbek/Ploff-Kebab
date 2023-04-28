import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthMessageResponseEntity>> register(
      RegisterRequestEntity requestEntity);

  Future<Either<Failure, AuthMessageResponseEntity>> login(
      LoginRequestEntity requestEntity);

  Future<Either<Failure, PhoneResponseEntity>> customerPhone(
      PhoneRequestEntity requestEntity);

  Future<Either<Failure, ConfirmResponseEntity>> confirmRegister(
      ConfirmRequestEntity requestEntity);

  Future<Either<Failure, ConfirmResponseEntity>> confirmLogin(
      ConfirmRequestEntity requestEntity);
}
