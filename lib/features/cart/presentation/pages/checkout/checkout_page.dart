import 'package:ploff_kebab/core/enums/app_enums.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/subpages/delivery_page.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/subpages/selfpickup_page.dart';
import 'package:ploff_kebab/features/orders/presentation/widgets/custom_tabbar.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage>
    with TickerProviderStateMixin {
  final TextEditingController floorController = TextEditingController();

  final TextEditingController entranceController = TextEditingController();

  final TextEditingController flatController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  PaymentType? paymentType = PaymentType.Cash;
  DeliveryMethod? deliveryMethod = DeliveryMethod.Express;
  CourierCall? courierCall = CourierCall.Yes;
  PageController controller = PageController();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Checkout order",
          style: AppTextsyles.w600.copyWith(fontSize: 20.sp),
        ),
        bottom: CustomTabBar(
          firstTabText: "Delivery",
          secondTabText: "Self pick-up",
          tabController: tabController,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                DeliveryPage(
                    entranceController: entranceController,
                    floorController: floorController,
                    flatController: flatController,
                    courierValueChanged: (value) {
                      setState(
                        () {
                          courierCall = value;
                        },
                      );
                    },
                    deliverValueChanged: (value) {
                      deliveryMethod = value;
                      setState(() {});
                    },
                    isEnabled: true,
                    paymenValueChanged: (value) {
                      paymentType = value;
                      setState(() {});
                    },
                    courierCall: courierCall,
                    deliveryMethod: deliveryMethod,
                    paymentType: paymentType,
                    addressController: addressController),
                SelfPickUpPage(
                    paymentType: paymentType,
                    paymentValueChanged: (value) {
                      paymentType = value;
                      setState(() {});
                    }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.white,
        child: SafeArea(
          minimum: AppUtils.kPaddingAll16,
          child: PrimaryButtonWidget(
            text: "Chekout order",
            onTap: () {},
          ),
        ),
      ),
    );
    ;
  }
}
