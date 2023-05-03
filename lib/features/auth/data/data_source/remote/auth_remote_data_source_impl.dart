part of 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  var requestOptions = Options(
    contentType: 'application/json',
    sendTimeout: const Duration(seconds: 30),
  );

  @override
  Future<AuthMessageResponseModel> login(
      LoginRequestModel signInRequestModel) async {
    try {
      final response = await dio.post(
        Constants.baseUrl + Urls.SIGN_IN_URL,
        data: jsonEncode(signInRequestModel.toJson()),
        options: requestOptions,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthMessageResponseModel.fromJson(response.data);
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioError catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<AuthMessageResponseModel> register(
      RegisterRequestModel signUpRequestModel) async {
    try {
      final response = await dio.post(
        Constants.baseUrl + Urls.SIGN_UP_URL,
        data: jsonEncode(
          signUpRequestModel.toJson(),
        ),
        options: requestOptions,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthMessageResponseModel.fromJson(response.data);
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioError catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<PhoneResponseModel> sendPhone(
      PhoneRequestModel phoneRequestModel) async {
    try {
      final response = await dio.post(
        Constants.baseUrl + Urls.CUSTOMERS_PHONE,
        data: jsonEncode(
          phoneRequestModel.toJson(),
        ),
        options: requestOptions,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return PhoneResponseModel.fromJson(response.data);
      } else {
        print(">>>1");
        throw ServerException.fromJson(response.data["Error"]);
      }
    } on DioError catch (e) {
      print(">>>2");

      throw ServerException.fromJson(e.response?.data["Error"]);
    } on FormatException {
      print(">>>3");

      throw ServerException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<ConfirmResponseModel> confirmCode(
      ConfirmRequestModel confirmRequestModel, ConfirmStatus status) async {
    var myStatus = status == ConfirmStatus.login
        ? Urls.LOGIN_CONFIRM
        : Urls.REGISTER_CONFIRM;
    try {
      final response = await dio.post(
        Constants.baseUrl + myStatus,
        data: jsonEncode(
          confirmRequestModel.toJson(),
        ),
        options: requestOptions,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ConfirmResponseModel.fromJson(response.data);
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioError catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }
}
