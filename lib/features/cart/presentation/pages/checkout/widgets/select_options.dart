import 'package:ploff_kebab/export_files.dart';

class SelectOptions extends StatelessWidget {
  final String title;
  final String firstSelect;
  final String secondSelect;
  final Object? firstValue;
  final Object? firstGroupValue;
  final Object? secondValue;
  final Object? secondGroupValue;
  final ValueChanged firstOnTap;
  final ValueChanged secondOnTap;
  const SelectOptions({
    super.key,
    required this.firstGroupValue,
    required this.firstOnTap,
    required this.firstValue,
    required this.secondGroupValue,
    required this.secondValue,
    required this.secondOnTap,
    required this.title,
    required this.firstSelect,
    required this.secondSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextsyles.w600.copyWith(fontSize: 17.0.sp),
        ),
        RadioListTile(
          activeColor: AppColors.cFFCC00,
          title: Text(
            firstSelect,
            style: AppTextsyles.w400.copyWith(fontSize: 15.0.sp),
          ),
          value: firstValue,
          groupValue: firstGroupValue,
          onChanged: firstOnTap,
        ),
        const Divider(),
        RadioListTile(
          activeColor: AppColors.cFFCC00,
          title: Text(
            secondSelect,
            style: AppTextsyles.w400.copyWith(fontSize: 15.0.sp),
          ),
          value: secondValue,
          groupValue: secondGroupValue,
          onChanged: secondOnTap,
        ),
      ],
    );
  }
}
