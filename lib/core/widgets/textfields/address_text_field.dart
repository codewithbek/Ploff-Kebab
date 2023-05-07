import 'package:ploff_kebab/export_files.dart';

class AddressTextFields extends StatelessWidget {
  final bool isEnabled;
  final TextEditingController addressController;
  const AddressTextFields(
      {Key? key, required this.isEnabled, required this.addressController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: AppColors.cF0F0F0,
      ),
      child: TextField(
        controller: addressController,
        enabled: isEnabled,
        decoration: InputDecoration(
          hintStyle: AppTextsyles.w400
              .copyWith(fontSize: 15.sp, color: AppColors.black3),
          hintText: "Address",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
