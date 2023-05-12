import 'package:ploff_kebab/core/widgets/dialogs/delete_dialogs.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/cart/presentation/blocs/counter_cubit.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/product_detail/product_detail_cubit.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.black3.withOpacity(.1),
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
                  Text(widget.aboutMeal.description,
                      style: AppTextsyles.w400
                          .copyWith(fontSize: 12.sp, color: AppColors.black3),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 30.h),
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
                  ZoomTapAnimation(
                      onTap: () {
                        myCustomDialog(
                            context: context,
                            onTap: () {
                              context
                                  .read<ProductDetailCubit>()
                                  .deleteCachedProductById(widget.aboutMeal.id);
                              Navigator.pop(context);
                            },
                            asktext:
                                "Are you sure?\n Do you want to remove a product from the list?");
                      },
                      child: SvgPicture.asset(AppIcons.cancel)),
                  SizedBox(height: 40.0.h),
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
                              marginH: 5.w,
                              iconWiwth: 10.w,
                              imagePath: AppIcons.minus,
                              onTap: () {
                                setState(() => {
                                      if (count > 1)
                                        {
                                          count--,
                                        }
                                    });
                                // context.read<CounterCubit>().decrement();
                              },
                            ),
                            Text(
                              count.toString(),
                              style: AppTextsyles.w500.copyWith(
                                fontSize: 15.0.sp,
                              ),
                            ),
                            IncDecButtons(
                              marginH: 5.w,
                              iconWiwth: 10.w,
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                                // context.read<CounterCubit>().increment();
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
