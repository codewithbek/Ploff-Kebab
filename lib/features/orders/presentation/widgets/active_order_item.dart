import 'package:ploff_kebab/export_files.dart';

class ActiveOrderItem extends StatelessWidget {
  const ActiveOrderItem({
    Key? key,
    required this.isVisible,
    required this.onTap,
  }) : super(key: key);

  final bool isVisible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.0.h),
        padding: EdgeInsets.all(16.0.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order No:123321",
                  style: AppTextsyles.w600.copyWith(
                    fontSize: 17.0.sp,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: AppColors.c0E73F6.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                  ),
                  // style: ButtonStyle(
                  //   shape: MaterialStateProperty.all(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8.0.r),
                  //     ),
                  //   ),
                  //   shadowColor: MaterialStateProperty.all(
                  //     Colors.transparent,
                  //   ),
                  // ),
                  onPressed: () {},
                  child: Text(
                    "Order is processed",
                    style: AppTextsyles.w500
                        .copyWith(color: AppColors.c0E73F6, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cFFCC00,
                  ),
                  child: SvgPicture.asset(AppIcons.done),
                ),
                Expanded(
                  child: Container(
                    height: 2.0.h,
                    color: !isVisible ? AppColors.cFFCC00 : AppColors.cF0F0F0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cFFCC00,
                  ),
                  child: SvgPicture.asset(AppIcons.chef),
                ),
                Expanded(
                  child: Container(
                    height: 2.0.h,
                    color: !isVisible ? AppColors.cFFCC00 : AppColors.cF0F0F0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cFAFAFA,
                  ),
                  child: SvgPicture.asset(AppIcons.car),
                ),
                Expanded(
                  child: Container(
                    height: 2.0.h,
                    color: isVisible ? AppColors.cFFCC00 : AppColors.cF0F0F0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cFAFAFA,
                  ),
                  child: SvgPicture.asset(AppIcons.flag),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
