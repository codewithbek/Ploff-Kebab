import 'package:ploff_kebab/export_files.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class IncDecButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final double? iconWiwth;
  final double? marginH;

  const IncDecButtons({
    Key? key,
    this.iconWiwth,
    this.marginH,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0.r),
        margin: EdgeInsets.symmetric(horizontal: marginH ?? 10.0.w),
        child: SvgPicture.asset(
          imagePath,
          width: iconWiwth ?? 20.0.w,
        ),
      ),
    );
  }
}
