import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/widgets/check_item.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/widgets/select_payment.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SelfPickUpPage extends StatefulWidget {
  final ValueChanged paymentValueChanged;
  final Object? paymentType;

  const SelfPickUpPage({
    super.key,
    required this.paymentType,
    required this.paymentValueChanged,
  });

  @override
  State<SelfPickUpPage> createState() => _SelfPickUpPageState();
}

class _SelfPickUpPageState extends State<SelfPickUpPage> {
  int branchIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0.h),
                  padding: EdgeInsets.all(16.0.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The nearest branches",
                        style: AppTextsyles.w500.copyWith(fontSize: 18.0.sp),
                      ),
                      SizedBox(
                        height: 156.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0.r),
                          child: Stack(
                            children: [
                              YandexMap(
                                tiltGesturesEnabled: false,
                                mapType: MapType.map,
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(36.w, 36.w),
                                    maximumSize: Size(36.w, 36.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                    AppIcons.big,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text("Samarqand Darvoza"),
                        onTap: () {
                          branchIndex = 0;
                          setState(() => {});
                        },
                        subtitle: const Text("SSS, Tshkent"),
                        trailing: Icon(
                          branchIndex == 1
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: AppColors.cFFCC00,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          branchIndex = 1;
                          setState(() => {});
                        },
                        title: const Text("Toshkent"),
                        subtitle: const Text("SSS, Tshkent"),
                        trailing: Icon(
                          branchIndex == 0
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: AppColors.cFFCC00,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SelectPaymentType(
                  valueChanged: widget.paymentValueChanged,
                  paymentType: widget.paymentType,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0.h),
                  padding: EdgeInsets.all(10.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: const [
                      CheckItem(
                        item: "String",
                        price: "2300",
                      ),
                      CheckItem(
                        item: "String",
                        price: "2300",
                      ),
                      CheckItem(
                        item: "String",
                        price: "2300",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
