
import 'package:ploff_kebab/export_files.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        disabledBackgroundColor: AppColors.white,
        backgroundColor: AppColors.cFFCC00,
        minimumSize: Size(200.w, 52.h),
        maximumSize: Size(200.w, 52.h),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: AppTextsyles.w600.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
