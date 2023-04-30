import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ploff_kebab/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_login.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/confirm_register.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/send_phone.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/login.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/register.dart';

import 'features/auth/data/data_source/remote/auth_remote_data_source.dart';

final sl = GetIt.instance;
late Box<dynamic> box;

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

  authFeature();
  mainFeature();
  homeFeature();
}

void mainFeature() {
  sl.registerLazySingleton(() => MainBloc());
}

void homeFeature() {
  ///Bloc
  sl.registerLazySingleton(
    () => HomeBloc(
      getBanner: sl(),
      getCategoriesWithProductsUseCase: sl(),
    ),
  );
  // sl.registerLazySingleton(() => SearchBloc(getLoungesUseCase: sl()));

  ///Usecases
  sl.registerLazySingleton<GetBannerUseCase>(
    () => GetBannerUseCase(repository: sl()),
  );
  sl.registerLazySingleton<GetCategoriesWithProductsUseCase>(
    () => GetCategoriesWithProductsUseCase(repository: sl()),
  );

  // //searching usecases
  // sl.registerLazySingleton<GetLoungesUseCase>(() => GetLoungesUseCase(
  //       repository: sl(),
  //     ));

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
  //   () => HomeLocalDataSourceImpl(box: box),
  // );
}

//-----------------------------------------

void authFeature() {
  
  ///Usecases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<Register>(() => Register(sl()));
  sl.registerLazySingleton<ConfirmLoginUseCase>(
      () => ConfirmLoginUseCase(sl()));
  sl.registerLazySingleton<ConfirmRegisterUseCase>(
      () => ConfirmRegisterUseCase(sl()));
  sl.registerLazySingleton<SendPhone>(() => SendPhone(sl()));

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
