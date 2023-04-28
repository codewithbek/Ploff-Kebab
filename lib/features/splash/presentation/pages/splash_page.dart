import 'package:ploff_kebab/export_files.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.isTimerFinished) {
          Navigator.pushReplacementNamed(
            context,
            RouteNames.main,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Image.asset(
            AppImages.ploffLogo,
            height: 240.0.h,
            width: 271.0.w,
          ),
        ),
      ),
    );
  }
}
