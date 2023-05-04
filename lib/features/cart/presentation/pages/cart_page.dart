import 'package:ploff_kebab/export_files.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.products.isNotEmpty) {
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
                    // deleteAllDialog(context);
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
                state.products.length,
                (index) => SliverToBoxAdapter(
                  child: CartsItem(
                    aboutMeal: state.products[index],
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
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: AppUtils.kPaddingAll12,
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
