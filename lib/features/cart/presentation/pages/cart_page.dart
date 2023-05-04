import 'package:ploff_kebab/core/widgets/dialogs/delete_dialogs.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/product_detail_cubit.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        if (state.productHiveModel!.isNotEmpty) {
          return Scaffold(
            backgroundColor: AppColors.cF0F0F0,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Cart",
                style: AppTextsyles.w600.copyWith(fontSize: 20.0.sp),
              ),
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              actions: [
                IconButton(
                  onPressed: () {
                    myCustomDialog(
                        context: context,
                        onTap: () {
                          context
                              .read<ProductDetailCubit>()
                              .deleteAllCachedProducts();
                          Navigator.pop(context);
                        },
                        asktext: "Are you sure you want to clear cart");
                  },
                  icon: SvgPicture.asset(AppIcons.korzina),
                ),
              ],
            ),
            body: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.0.h,
                ),
              ),
              ...List.generate(
                state.productHiveModel!.length,
                (index) => SliverToBoxAdapter(
                  child: CartsItem(
                    aboutMeal: state.productHiveModel![index],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.0.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(10.0.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add comment",
                        style: AppTextsyles.w600.copyWith(fontSize: 15.0.sp),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0.r),
                          color: AppColors.cF0F0F0,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add comment to order",
                            hintStyle: AppTextsyles.w400.copyWith(
                              fontSize: 15.0.sp,
                              color: AppColors.c858585,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 12.h,
                ),
              ),
            ]),
            bottomNavigationBar: ColoredBox(
              color: AppColors.white,
              child: SafeArea(
                minimum: AppUtils.kPaddingAll16,
                child: PrimaryButtonWidget(
                  text: "Chekout order",
                  onTap: () {
                    // Navigator.pushReplacementNamed(context, RouteNames.main);
                  },
                ),
              ),
            ),
          );
        }
        return const EmptyPage();
      },
    );
  }
}
