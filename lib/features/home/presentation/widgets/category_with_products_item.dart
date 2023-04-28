import 'package:ploff_kebab/export_files.dart';

class CategoryWithProductsItem extends StatelessWidget {
  const CategoryWithProductsItem({Key? key, required this.category})
      : super(key: key);
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppUtils.kPaddingAll16,
          child: Text(category.title.uz,
              style: AppTextsyles.w600
                  .copyWith(color: AppColors.black1, fontSize: 22.sp)),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: category.products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = category.products[index];
            return _productInfoItem(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.pushNamed(
                  rootNavigatorKey.currentContext!,
                  RouteNames.prouductDetail,
                  arguments: product,
                );
              },
              title: product.title.uz,
              subtitle: product.description.uz,
              price: product.outPrice,
              imgUrl: AppIcons.dish,
              index: index,
              length: category.products.length,
            );
          },
        ),
      ],
    );
  }

  Widget _productInfoItem({
    required String title,
    required String subtitle,
    required int price,
    required String imgUrl,
    required VoidCallback onTap,
    required int index,
    required int length,
  }) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0.r),
        onTap: onTap,
        child: Ink(
          color: AppColors.white,
          child: Container(
            height: 120,
            margin: AppUtils.kPaddingHorizontal16,
            decoration: BoxDecoration(
              border: index != length - 1
                  ? Border(
                      bottom: BorderSide(
                        color: AppColors.black.withOpacity(.1),
                      ),
                    )
                  : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text(title,
                          style: AppTextsyles.w500.copyWith(
                              color: AppColors.black1, fontSize: 15.sp)),
                      SizedBox(height: 8.h),
                      Text(subtitle,
                          style: const TextStyle(
                              fontSize: 13, color: AppColors.c858585),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 18.h),
                      Text("$price so'm",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
