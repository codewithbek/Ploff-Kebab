import 'package:ploff_kebab/core/widgets/custom_text_field.dart';
import 'package:ploff_kebab/core/widgets/masked_text_input_formatter.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/presentation/widgets/auth_layout.dart';

typedef OnPhoneNumberChanged = void Function(String);

class PhoneNumberSubPage extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? errorText;
  final OnPhoneNumberChanged onPhoneNumberChanged;
  final OnFieldSubmitted? onFieldSubmitted;

  const PhoneNumberSubPage({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onPhoneNumberChanged,
    this.onFieldSubmitted,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final localization = AppLocalization.of(context);
    return AuthLayout(
      title: "Your phone number",
      // title: localization.your_phone_number,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppUtils.kGap32,
          Text(
            "We will send a verification code to your number",
            // localization.send_code_text,
            textAlign: TextAlign.start,
            style: AppTextsyles.w400.copyWith(
              color: AppColors.cF0F0F0,
            ),
          ),
          AppUtils.kGap40,
          CustomTextField(
            key: key,
            controller: controller,
            labelText: "Phone number",
            // labelText: localization.phone_number,
            labelTextStyle: AppTextsyles.w400.copyWith(
              color: AppColors.black1,
            ),
            textInputFormatter: [
              MaskedTextInputFormatter(
                mask: "## ### ## ##",
                separator: " ",
              ),
              FilteringTextInputFormatter.allow(
                RegExp(r'\d'),
                replacementString: ' ',
              ),
            ],
            textInputType: TextInputType.number,
            contentPadding: AppUtils.kPaddingAll12,
            prefixIcon: Padding(
              padding: AppUtils.kPaddingLeft12Right6Ver8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.flag,
                    size: 24,
                  ),
                  AppUtils.kGap8,
                  Text(
                    '+998',
                    style: AppTextsyles.w400.copyWith(color: AppColors.black1),
                  )
                ],
              ),
            ),
            onChanged: onPhoneNumberChanged,
            onFieldSubmitted: (value) {
              onFieldSubmitted?.call(value);
              focusNode.unfocus();
            },
            focusNode: focusNode,
            cursorHeight: 20,
            errorText: errorText,
            hintText: "Enter phone number",
            // hintText: localization.type_phone_number,
          ),
        ],
      ),
    );
  }
}
