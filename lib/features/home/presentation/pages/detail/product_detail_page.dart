import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/product_detail/product_detail_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProductDeatilPage extends StatefulWidget {
  const ProductDeatilPage({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDeatilPage> createState() => _ProductDeatilPageState();
}

class _ProductDeatilPageState extends State<ProductDeatilPage> {
  late ProductDeatilPage _myWidget;

  @override
  void initState() {
    _myWidget = widget;
    super.initState();
  }

  int modifierindex = -1;
  int modifierPrice = 0;
  int price = 0;

  var count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF0F0F0,
      body: BlocListener<ProductDetailCubit, ProductDetailState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                backgroundColor: AppColors.c22C348,
                message: 'Buyurtmangiz savatga qo\'shildi',
              ),
            );
          } else if (state.status == FormzSubmissionStatus.inProgress) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                backgroundColor: AppColors.cFFCC00,
                message: 'jarayonda',
              ),
            );
          } else if (state.status == FormzSubmissionStatus.failure) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                backgroundColor: AppColors.red,
                message: Validations.SOMETHING_WENT_WRONG,
              ),
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(.8),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppIcons.arrowBack,
                                width: 7.w,
                                height: 13.h,
                              ),
                            )),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Container(
                          padding: EdgeInsets.all(10.0.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(.8),
                          ),
                          child: SvgPicture.asset(AppIcons.share),
                        ),
                      ),
                    ],
                    pinned: true,
                    collapsedHeight: 200.0.h,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        AppImages.banner,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.product.title.uz,
                            style: AppTextsyles.w500,
                          ),
                          Text(
                            "Ba'tafsil: ${widget.product.description.uz}",
                            style: AppTextsyles.w400.copyWith(
                              fontSize: 15.0.sp,
                              color: AppColors.black1.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0.r),
                        color: AppColors.white,
                      ),
                      height: 280.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0.w, top: 16),
                            child: Text(
                              "Test type",
                              style: AppTextsyles.w500
                                  .copyWith(color: AppColors.black1),
                            ),
                          ),
                          ...List.generate(
                            4,
                            (index) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0.r),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: index != 6 - 1
                                      ? BorderSide(
                                          color:
                                              AppColors.black.withOpacity(.1),
                                        )
                                      : BorderSide.none,
                                ),
                              ),
                              child: ListTile(
                                leading: modifierindex == index
                                    ? const Icon(
                                        Icons.radio_button_checked,
                                        color: AppColors.cFFCC00,
                                      )
                                    : const Icon(Icons.radio_button_off),
                                title: Text(widget.product.type),
                                trailing:
                                    Text(widget.product.outPrice.toString()),
                                onTap: () {
                                  setState(() {
                                    modifierindex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.white,
        child: SafeArea(
          minimum: AppUtils.kPaddingAll16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                          imagePath: AppIcons.minus,
                          onTap: () {
                            setState(() {
                              if (count > 1) count--;
                              count * widget.product.outPrice;
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
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          imagePath: AppIcons.plus,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      (widget.product.outPrice * count).toString(),
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextsyles.w600.copyWith(
                        fontSize: 18.0.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0.h),
              BlocBuilder<ProductDetailCubit, ProductDetailState>(
                builder: (context, state) {
                  return PrimaryButtonWidget(
                    onTap: () async {
                      context
                          .read<ProductDetailCubit>()
                          .addProduct(productModel: widget.product);

                      await Future.delayed(const Duration(seconds: 4));
                      Navigator.pop(context, true);
                    },
                    text: "Add",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
