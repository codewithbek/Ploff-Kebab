import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/orders/presentation/widgets/active_order_item.dart';
import 'package:ploff_kebab/features/orders/presentation/widgets/custom_tabbar.dart';
import 'package:ploff_kebab/features/orders/presentation/widgets/history_order_item.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  bool isCurrent = false;
  int index = 0;
  late TabController tabController;
  bool isVisible = false;

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
          "My Orders",
          style: AppTextsyles.w600.copyWith(fontSize: 20.sp),
        ),
        bottom: CustomTabBar(
          firstTabText: "Active orders",
          secondTabText: "Orders history",
          tabController: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Column(
            children: [
              SizedBox(
                height: 6.0.h,
              ),
              ActiveOrderItem(
                isVisible: true,
                onTap: () {},
              ),
              ActiveOrderItem(
                isVisible: false,
                onTap: () {},
              ),
              ActiveOrderItem(
                isVisible: false,
                onTap: () {},
              ),
              SizedBox(
                height: 6.0.h,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 6.0.h,
              ),
              const HistoryOrderItem(),
              const HistoryOrderItem(),
              const HistoryOrderItem(),
              SizedBox(
                height: 6.0.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
