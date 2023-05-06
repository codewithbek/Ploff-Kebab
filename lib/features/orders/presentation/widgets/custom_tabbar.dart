import 'package:ploff_kebab/export_files.dart';

class CustomTabBar extends StatelessWidget implements PreferredSize {
  final String firstTabText;
  final String secondTabText;

  const CustomTabBar({
    Key? key,
    required this.tabController,
    required this.firstTabText,
    required this.secondTabText,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0.r),
      margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: AppColors.cF0F0F0,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: AppColors.cF0F0F0,
        controller: tabController,
        labelColor: AppColors.black,
        unselectedLabelColor: AppColors.black3,
        labelStyle: AppTextsyles.w500.copyWith(fontSize: 15.sp),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: AppColors.white,
        ),
        onTap: (value) {},
        tabs: [
          Tab(
            height: 40.0.h,
            child: Text(
              firstTabText,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
          Tab(
            height: 40.0.h,
            child: Text(
              secondTabText,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
