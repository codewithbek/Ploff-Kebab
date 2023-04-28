import 'package:ploff_kebab/export_files.dart';

class PloffApp extends StatelessWidget {
  const PloffApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Ploff & Kebab',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          )),
          navigatorKey: rootNavigatorKey,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
