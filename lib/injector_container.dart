import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ploff_kebab/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_code_usecase.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/send_phone_usecase.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/login_usecase.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/register_usecase.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:ploff_kebab/features/home/domain/usecases/get_product_by_id_usecase.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/location/current_location_cubit.dart';

import 'features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'features/cart/presentation/blocs/counter_cubit.dart';

final sl = GetIt.instance;
late Box<dynamic> box;
late Box<dynamic> productBox;

Future<void> init() async {
  //External
  await initHive();

  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        headers: {
          "Shipper": Constants.shipperId,
          "Platform": Constants.androidPlatformID,
        },
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            request: true,
            responseBody: true,
            error: true,
            requestBody: true,
          ),
          if (kDebugMode) chuck.getDioInterceptor(),
        ],
      ),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerSingleton<LocalSource>(LocalSource(box));

  mainFeature();
  homeFeature();
  cartFeature();
  authFeature();
}

void mainFeature() {
  // Bloc
  sl.registerFactory(() => MainBloc());
}

void homeFeature() {
  ///Bloc
  sl.registerFactory(
    () => HomeBloc(
        getBanner: sl(),
        getCategoriesWithProductsUseCase: sl(),
        getProductByIdUseCase: sl()),
  );
  // sl.registerFactory(() => CurrentLocationCubit());

  // sl.registerLazySingleton(() => SearchBloc(getLoungesUseCase: sl()));

  ///Usecases
  sl.registerLazySingleton<GetBannerUseCase>(
    () => GetBannerUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetCategoriesWithProductsUseCase>(
    () => GetCategoriesWithProductsUseCase(repository: sl()),
  );
  sl.registerLazySingleton<GetProductByIdUseCase>(
    () => GetProductByIdUseCase(repository: sl()),
  );

  ///Repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  /// Data and Network
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: sl()),
  );
  // sl.registerLazySingleton<HomeLocalDataSource>(
  //   () => HomeLocalDataSourceImpl(box: productBox),
  // );
}

//-----------------------------------------
void cartFeature() {
  // Bloc
  sl.registerFactory(
    () => CounterCubit(),
  );
}

//-----------------------------------------

void authFeature() {
  ///Bloc
  sl.registerFactory(
    () => LoginBloc(login: sl(), sendPhone: sl()),
  );
  sl.registerFactory(() => RegisterBloc(signUp: sl()));
  sl.registerFactory(() => ConfirmCodeBloc(
        confirmCode: sl(),
      ));

  ///Usecases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<ConfirmCodeUseCase>(() => ConfirmCodeUseCase(sl()));
  sl.registerLazySingleton<SendPhoneUseCase>(() => SendPhoneUseCase(sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
      authLocalDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  ///Data and Network
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      box,
    ),
  );
}

//--------------------

Future<void> initHive() async {
  const boxName = 'ploff_kebab_box';
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  box = await Hive.openBox<dynamic>(boxName);
}
