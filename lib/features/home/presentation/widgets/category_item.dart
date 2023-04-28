import 'package:ploff_kebab/export_files.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.selected,
    required this.title,
  }) : super(key: key);
  final bool selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: selected ? AppColors.cFFCC00 : AppColors.cF5F5F5,
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextsyles.w500
              .copyWith(fontSize: 15.sp, color: AppColors.black1),
        ),
      ),
    );
  }
}
