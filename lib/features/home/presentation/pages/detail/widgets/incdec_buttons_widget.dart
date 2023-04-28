import 'package:ploff_kebab/export_files.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class IncDecButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;

  const IncDecButtons({
    Key? key,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0.r),
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: SvgPicture.asset(
          imagePath,
          width: 20.0.w,
        ),
      ),
    );
  }
}
