import 'package:ploff_kebab/core/constants/constants.dart';
import 'package:ploff_kebab/core/error/exceptions.dart';
import 'package:ploff_kebab/features/auth/data/models/confirm/confirm_request_model.dart';
import 'package:ploff_kebab/features/auth/data/models/confirm/confirm_response_model.dart';
import 'package:ploff_kebab/features/auth/data/models/login/login_request_model.dart';
import 'package:ploff_kebab/features/auth/data/models/phone/phone_request_model.dart';
import 'package:ploff_kebab/features/auth/data/models/phone/phone_response_model.dart';
import 'package:ploff_kebab/features/auth/data/models/register/register_request_model.dart';
import '../../models/auth_response_model.dart';
import 'dart:convert';

import 'package:dio/dio.dart';

part 'auth_remote_data_source_impl.dart';

abstract class AuthRemoteDataSource {
  Future<AuthMessageResponseModel> login(LoginRequestModel signInRequestModel);

  Future<AuthMessageResponseModel> register(
      RegisterRequestModel signUpRequestModel);

  Future<PhoneResponseModel> sendPhone(PhoneRequestModel phoneRequestModel);

  Future<ConfirmResponseModel> confirmRegister(
      ConfirmRequestModel confirmRequestModel);

  Future<ConfirmResponseModel> confirmLogin(
      ConfirmRequestModel confirmRequestModel);
}
