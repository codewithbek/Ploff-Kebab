import 'package:ploff_kebab/export_files.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: PrimaryButtonWidget(
            text: "Add product",
            onTap: () {
              Navigator.pushReplacementNamed(context, RouteNames.main);
            },
          ),
        ),
      ),
    );
  }
}
