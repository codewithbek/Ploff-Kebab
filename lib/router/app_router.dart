import 'package:flutter/cupertino.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';

import 'package:ploff_kebab/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register/register_bloc.dart';
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
            create: (context) => sl<LoginBloc>(),
            child: const LoginPage(),
          ),
        );
      case RouteNames.register:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<RegisterBloc>(),
            child: const RegisterPage(),
          ),
        );

      case RouteNames.confirmCode:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<ConfirmCodeBloc>(),
            child: const ConfirmCodePage(),
          ),
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
