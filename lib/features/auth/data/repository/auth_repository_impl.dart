import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/core/error/exceptions.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ploff_kebab/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ploff_kebab/features/auth/data/models/confirm/confirm_request_model.dart';
import 'package:ploff_kebab/features/auth/data/models/confirm/confirm_response_model.dart';
import 'package:ploff_kebab/features/auth/data/models/login/login_request_model.dart';
import 'package:ploff_kebab/features/auth/data/models/auth_response_model.dart';
import 'package:ploff_kebab/features/auth/data/models/phone/phone_request_model.dart';
import 'package:ploff_kebab/features/auth/data/models/phone/phone_response_model.dart';
import 'package:ploff_kebab/features/auth/data/models/register/register_request_model.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_response_etity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/confirm/confirm_request_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_response_entity.dart';
import 'package:ploff_kebab/features/auth/domain/entities/phone/phone_request_entity.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthMessageResponseEntity>> login(
      LoginRequestEntity requestEntity) async {
    debugPrint('login ishga tushdi >>>>>>>> ');

    final request = LoginRequestModel(
      phone: requestEntity.phone,
      tag: requestEntity.tag,
    );
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.login(request);
        return Right(response.toEntity());
      } catch (e) {
        return Left(
          ServerFailure(
            message: e.toString(),
          ),
        );
      }
    } else {
      return Left(
        NoInternetFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, AuthMessageResponseEntity>> register(
      RegisterRequestEntity requestEntity) async {
    debugPrint('Registerga kirdi >>>>>>>> ');

    final signUpRequestModel = RegisterRequestModel(
        name: requestEntity.name,
        phone: requestEntity.phone,
        registrationSource: requestEntity.registrationSource,
        tag: requestEntity.tag);
    if (await networkInfo.isConnected) {
      try {
        final response =
            await authRemoteDataSource.register(signUpRequestModel);
        return Right(response.toEntity());
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, PhoneResponseEntity>> sendPhone(
      PhoneRequestEntity requestEntity) async {
    debugPrint('Telefon raqam jo\'natildi >>>>>>>> ');

    final phoneModel = PhoneRequestModel(phone: requestEntity.phone);
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.sendPhone(phoneModel);
        return Right(response.toEntity());
      } catch (e) {
        if (e is ServerException) {
          return Left(ServerFailure(message: (e).message));
        }
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, ConfirmResponseEntity>> confirmCode(
    ConfirmRequestEntity requestEntity,
    ConfirmStatus status,
  ) async {
    debugPrint('confirmCode ishga tushdi >>>>>>>> ');

    final confirmLoginModel = ConfirmRequestModel(
      fcmToken: requestEntity.fcmToken,
      phone: requestEntity.phone,
      code: requestEntity.code,
    );
    if (await networkInfo.isConnected) {
      try {
        final response =
            await authRemoteDataSource.confirmCode(confirmLoginModel, status);
        return Right(response.toEntity());
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
