import 'package:ploff_kebab/export_files.dart';

Future<dynamic> deleteAllDialog(
    {required BuildContext context,
    required VoidCallback onTap,
    required String asktext}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Attention",
            style: AppTextsyles.w600.copyWith(fontSize: 20.0.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            asktext,
            style: AppTextsyles.w400.copyWith(
              fontSize: 15.0.sp,
              color: AppColors.c858585,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: const DialogButtons(
                    color: AppColors.cF0F0F0,
                    text: 'Cancel',
                  ),
                ),
              ),
              SizedBox(
                width: 5.0.w,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: const DialogButtons(
                    color: AppColors.cFFCC00,
                    text: 'Yes',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

class DialogButtons extends StatelessWidget {
  final String text;
  final Color color;
  const DialogButtons({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextsyles.w600.copyWith(fontSize: 15.sp),
        ),
      ),
    );
  }
}
