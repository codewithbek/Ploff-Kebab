import 'package:ploff_kebab/export_files.dart';

class HistoryOrderItem extends StatelessWidget {
  const HistoryOrderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.r),
      margin: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 10.0.w),
          Column(
            children: [
              Text(
                "Заказ №341",
                style: AppTextsyles.w600
                    .copyWith(fontSize: 17.0.sp, color: AppColors.black),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              Text(
                "85 000 сум",
                style: AppTextsyles.w600
                    .copyWith(fontSize: 17.0.sp, color: AppColors.black2),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: AppColors.c22C348.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      )),
                  onPressed: () {},
                  child: Text(
                    "Ordered",
                    style: AppTextsyles.w500
                        .copyWith(fontSize: 15.sp, color: AppColors.c22C348),
                  )),
              SizedBox(
                height: 20.0.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.calender,
                  ),
                  SizedBox(width: 5.0.w),
                  Text(
                    "11.05.2022",
                    style: AppTextsyles.w400.copyWith(
                      fontSize: 15.0.sp,
                      color: AppColors.black3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 10.0.w),
        ],
      ),
    );
  }
}
