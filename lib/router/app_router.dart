import 'package:flutter/cupertino.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/pages/confirm/confirm_code_page.dart';
import 'package:ploff_kebab/features/auth/presentation/pages/login/login_page.dart';
import 'package:ploff_kebab/features/cart/presentation/blocs/counter_cubit.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/checkout_page.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/location/current_location_cubit.dart';
import 'package:ploff_kebab/features/home/presentation/pages/detail/product_detail_page.dart';
import 'package:ploff_kebab/features/home/presentation/pages/location/location_page.dart';
import 'package:ploff_kebab/features/profile/presentation/settings/settings_page.dart';

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
        ConfirmStatus status = settings.arguments as ConfirmStatus;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<ConfirmCodeBloc>(),
            child: ConfirmCodePage(
              status: status,
            ),
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
              BlocProvider<CounterCubit>(
                create: (_) => sl<CounterCubit>(),
              ),
            ],
            child: const MainPage(),
          ),
        );
      case RouteNames.prouductDetail:
        ProductModel args = settings.arguments as ProductModel;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<HomeBloc>(),
            child: ProductDeatilPage(product: args),
          ),
        );
      case RouteNames.location:
        return CupertinoPageRoute(
          builder: (_) => const AddLocationPage(),
        );
      case RouteNames.checkout:
        return CupertinoPageRoute(
          builder: (_) => const CheckOutPage(),
        );
      case RouteNames.settings:
        return CupertinoPageRoute(
          builder: (_) => const SettingsPage(),
        );
    }

    return null;
  }
}
