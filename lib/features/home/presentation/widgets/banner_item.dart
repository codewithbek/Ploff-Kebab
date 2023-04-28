import 'package:ploff_kebab/export_files.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  late PageController bannerCon;
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    bannerCon = PageController();
  }

  @override
  void dispose() {
    bannerCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(12.r)),
        height: 204.h,
        margin: AppUtils.kPaddingVertical16,
        padding: AppUtils.kPaddingVertical16,
        child: Column(
          children: [
            SizedBox(
              height: 160,
              child: PageView.builder(
                controller: bannerCon,
                onPageChanged: (value) {},
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        AppImages.banner,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 50,
                height: 4,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
