import 'package:ploff_kebab/export_files.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  int selectedCategory = -1;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetCategoriesWithProductsEvent());
    BlocProvider.of<HomeBloc>(context).add(GetBannerEvent());
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cF5F5F5,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
          title: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.location),
                SizedBox(width: 10.w),
                Text(
                  'Add Location',
                  style: AppTextsyles.w400
                      .copyWith(color: AppColors.black1, fontSize: 15.sp),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset(AppIcons.arrowDown)
              ],
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status.isSuccess) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // SEARCH ITEM AND CATEGORIES LIST
                  SliverPersistentHeader(
                    delegate: SliverHeaderDelegate(
                      controller: _controller,
                      selectedCategory: selectedCategory,
                      valueChanged: (value) {},
                      categories: state.categoriesWithProducts.categories,
                    ),
                    pinned: true,
                  ),
                  // const BannerItem(),

                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var category =
                            state.categoriesWithProducts.categories[index];
                        return Container(
                          margin: EdgeInsetsDirectional.only(bottom: 10.h),
                          color: AppColors.white,
                          child: CategoryWithProductsItem(
                            category: category,
                          ),
                        );
                      },
                      childCount:
                          state.categoriesWithProducts.categories.length,
                    ),
                  ),
                ],
              );
            } else {
              return LoadingWidget();
            }
          },
        ));
  }
}

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const SliverHeaderDelegate({
    required this.selectedCategory,
    required this.controller,
    required this.valueChanged,
    required this.categories,
  });
  final TextEditingController controller;
  final ValueChanged valueChanged;
  final int selectedCategory;
  final List<CategoryEntity> categories;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var selectedCat = selectedCategory;
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          // SEARCH ITEM
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: CustomSearchItem(
              controller: controller,
              valueChanged: valueChanged,
            ),
          ),
          const SizedBox(height: 16),

          // CATEGORIES LIST
          StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SizedBox(
                height: 40,
                child: ListView.separated(
                  padding: AppUtils.kPaddingHorizontal16,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCat = index;
                        });
                      },
                      child: CategoryItem(
                          selected: index == selectedCat,
                          title: categories[index].title.uz),
                    );
                  },
                  itemCount: categories.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
