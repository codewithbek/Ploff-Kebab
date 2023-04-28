import 'package:flutter/cupertino.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/login.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/register.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/pages/confirm/confirm_code_page.dart';
import 'package:ploff_kebab/features/auth/presentation/pages/login/login_page.dart';
import 'package:ploff_kebab/features/home/presentation/pages/detail/product_detail_page.dart';

import '../features/auth/presentation/pages/register/register_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final Chuck chuck = Chuck(
  showNotification: true,
  showInspectorOnShake: false,
  darkTheme: false,
  navigatorKey: rootNavigatorKey,
);

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SplashBloc(),
            child: const SplashPage(),
          ),
        );
      case RouteNames.login:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginBloc(signIn: sl<Login>()),
            child: const LoginPage(),
          ),
        );
      case RouteNames.register:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterBloc(signUp: sl<Register>()),
            child: const RegisterPage(),
          ),
        );

         case RouteNames.pinPut:
        return CupertinoPageRoute(
          builder: (_) => const ConfirmCodePage(),
        );
      case RouteNames.main:
        return CupertinoPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<MainBloc>(
                create: (_) => sl<MainBloc>(),
              ),
              BlocProvider<HomeBloc>(
                create: (_) => sl<HomeBloc>(),
              ),
            ],
            child: const MainPage(),
          ),
        );
      case RouteNames.prouductDetail:
        ProductModel? args = settings.arguments as ProductModel?;
        return CupertinoPageRoute(
          builder: (_) => ProductDeatilPage(product: args),
        );
    }

    return null;
  }
}
