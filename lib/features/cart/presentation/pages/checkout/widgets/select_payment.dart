import 'package:ploff_kebab/core/enums/app_enums.dart';
import 'package:ploff_kebab/export_files.dart';

class SelectPaymentType extends StatelessWidget {
  final ValueChanged valueChanged;
  final Object? paymentType;
  const SelectPaymentType({
    super.key,
    required this.valueChanged,
    required this.paymentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0.h),
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment type",
            style: AppTextsyles.w600.copyWith(fontSize: 17.0.sp),
          ),
          RadioListTile(
              activeColor: AppColors.cFFCC00,
              title: Text(
                "Cash",
                style: AppTextsyles.w400.copyWith(fontSize: 15.0.sp),
              ),
              value: PaymentType.Cash,
              groupValue: paymentType,
              onChanged: valueChanged),
          const Divider(),
          RadioListTile(
              activeColor: AppColors.cFFCC00,
              title: Text(
                "Payme",
                style: AppTextsyles.w400.copyWith(fontSize: 15.0.sp),
              ),
              value: PaymentType.Payme,
              groupValue: paymentType,
              onChanged: valueChanged),
          const Divider(),
          RadioListTile(
            activeColor: AppColors.cFFCC00,
            title: Text(
              "Click",
              style: AppTextsyles.w400.copyWith(fontSize: 15.0.sp),
            ),
            value: PaymentType.Click,
            groupValue: paymentType,
            onChanged: valueChanged,
          ),
        ],
      ),
    );
  }
}
