import 'package:ploff_kebab/export_files.dart';

class CartsItem extends StatefulWidget {
  const CartsItem({
    Key? key,
    required this.aboutMeal,
  }) : super(key: key);

  final ProductModel aboutMeal;

  @override
  State<CartsItem> createState() => _CartsItemState();
}

class _CartsItemState extends State<CartsItem> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.black.withOpacity(.1),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.dish,
                width: 88.0.w,
                height: 88.0.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.0.w,
                    child: Text(
                      widget.aboutMeal.title.uz,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextsyles.w600.copyWith(fontSize: 17.0.sp),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SizedBox(
                    width: 150.0.w,
                    child: Text(
                      widget.aboutMeal.description.uz,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextsyles.w500.copyWith(fontSize: 15.0.sp),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15.0.w),
                    child: SvgPicture.asset(AppIcons.cancel),
                  ),
                  SizedBox(height: 25.0.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          setState(() => {
                                if (count > 1)
                                  {
                                    count--,
                                    // context
                                    //     .read<CountMealsCubit>()
                                    //     .removeMeals(),
                                    // context.read<BottomNavigationCubit>().sum -=
                                    //     widget.aboutMeal.outPrice,
                                    // log(widget.aboutMeal.outPrice.toString()),
                                  }
                              }),
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            padding: EdgeInsets.all(10.r),
                            height: 32.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0.r),
                              color: AppColors.cFAFAFA,
                            ),
                            child: SvgPicture.asset(AppIcons.minus)),
                      ),
                      Text("$count"),
                      GestureDetector(
                        onTap: () {
                          // context.read<CountMealsCubit>().addMeals();
                          // context.read<BottomNavigationCubit>().sum +=
                          //     widget.aboutMeal.outPrice;
                          setState(() => {count++});
                        },
                        child: Container(
                            height: 32.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                            padding: EdgeInsets.all(10.0.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0.r),
                              color: AppColors.cFAFAFA,
                            ),
                            child: SvgPicture.asset(AppIcons.plus)),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
