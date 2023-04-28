import 'package:ploff_kebab/export_files.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.emptyCart),
            SizedBox(height: 24.h),
            Text(
              "Thera are no products in the cart yet",
              style: AppTextsyles.w500
                  .copyWith(fontSize: 15.0.sp, color: AppColors.black2),
            ),
          ],
        ),
      ),
    );
  }
}
