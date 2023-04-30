import 'package:ploff_kebab/export_files.dart';


class AuthLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const AuthLayout({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingHorizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppUtils.kGap12,
          Text(
            title,
            style: AppTextsyles.w400,
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
