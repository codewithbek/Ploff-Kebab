import 'package:ploff_kebab/export_files.dart';

class MiniTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MiniTextFields({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cF0F0F0,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 10.0.h),
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: TextField(
          decoration: InputDecoration(
            hintStyle: AppTextsyles.w400
                .copyWith(fontSize: 15.sp, color: AppColors.black3),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
