import 'package:ploff_kebab/export_files.dart';

class CheckItem extends StatelessWidget {
  final String item;
  final String price;
  const CheckItem({
    Key? key,
    required this.item,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item,
          style: AppTextsyles.w500.copyWith(
            color: AppColors.black3,
            fontSize: 15.0.sp,
          ),
        ),
        Text(
          price,
          style: AppTextsyles.w600.copyWith(
            color: AppColors.black3,
            fontSize: 15.0.sp,
          ),
        ),
      ],
    );
  }
}
