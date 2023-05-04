import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';

class CartsItem extends StatefulWidget {
  const CartsItem({
    Key? key,
    required this.aboutMeal,
  }) : super(key: key);

  final ProductHiveModel aboutMeal;

  @override
  State<CartsItem> createState() => _CartsItemState();
}

class _CartsItemState extends State<CartsItem> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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
                width: 50.0.w,
                height: 50.0.h,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.aboutMeal.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextsyles.w600.copyWith(fontSize: 17.0.sp),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    " ${widget.aboutMeal.outPrice} sum",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextsyles.w500.copyWith(fontSize: 15.0.sp),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(AppIcons.cancel),
                  SizedBox(height: 25.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.0.r),
                          border: Border.all(
                            color: AppColors.black.withOpacity(.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            IncDecButtons(
                              marginH: 0,
                              iconWiwth: 10.w,
                              imagePath: AppIcons.minus,
                              onTap: () {
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
                                    });
                              },
                            ),
                            Text(
                              "$count",
                              style: AppTextsyles.w500.copyWith(
                                fontSize: 15.0.sp,
                              ),
                            ),
                            IncDecButtons(
                              marginH: 0,
                              iconWiwth: 10.w,
                              onTap: () {
                                setState(() {
                                  count++;
                                  // price = count * widget.product.outPrice;
                                });
                              },
                              imagePath: AppIcons.plus,
                            )
                          ],
                        ),
                      ),
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
