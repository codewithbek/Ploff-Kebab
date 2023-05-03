import 'package:pinput/pinput.dart';
import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({Key? key, required this.status}) : super(key: key);
  final ConfirmStatus status;

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> with CacheMixin {
  final defaultPinTheme = PinTheme(
    width: 60,
    height: 60,
    textStyle: TextStyle(
        fontSize: 20.sp, color: AppColors.black1, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: const Color(0xffF5F5F5),
      border: Border.all(color: const Color(0xffF5F5F5)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  int putLenght = 0;
  TextEditingController putController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: AppUtils.kPaddingHor16Ver12,
              child: Text(
                "Your phone code",
                style: AppTextsyles.w600.copyWith(fontSize: 28.sp),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppUtils.kGap24,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Enter 6-digit code from SMS",
                  style: TextStyle(color: Color(0xff92979B)),
                ),
                Text(localSource.getPhone().toString()),
              ],
            ),
          ),
          AppUtils.kGap40,
          AppUtils.kGap6,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Text(
              "Code",
              style: AppTextsyles.w500,
            ),
          ),
          AppUtils.kGap6,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Pinput(
              showCursor: true,
              enabled: true,
              closeKeyboardWhenCompleted: true,
              controller: putController,
              onCompleted: (value) {
                setState(() {
                  putLenght = value.length;
                });
                // context.read<ConfirmOtpBloc>().add(
                //   SendOtpChangedEvent(
                //     otp: /*state.otp ?? "",*/ value,
                //     smsId: widget.smsId,
                //   ),
                // );
              },
              length: 6,
              autofocus: true,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              separator: AppUtils.kBoxWidth12,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp('[0-9]'),
                  replacementString: '',
                ),
              ],
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              onChanged: (value) {},
              disabledPinTheme: defaultPinTheme.copyWith(
                textStyle: defaultPinTheme.textStyle!.copyWith(
                  color: Colors.black,
                ),
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.cFFCC00,
                  ),
                ),
              ),
              defaultPinTheme: defaultPinTheme,
              submittedPinTheme: defaultPinTheme.copyWith(
                textStyle: defaultPinTheme.textStyle!.copyWith(
                  color: Colors.black,
                ),
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.cFFCC00,
                  ),
                ),
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                textStyle: defaultPinTheme.textStyle!.copyWith(
                  color: Colors.black,
                ),
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cFFCC00),
                ),
              ),
            ),
          ),
          AppUtils.kSpacer,
          BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            builder: (context, state) {
              return SafeArea(
                minimum: AppUtils.kPaddingAll16,
                child: PrimaryButtonWidget(
                  text: "Continue",
                  onTap: () async {
                    if (putController.text == "888888" &&
                        putController.text.isNotEmpty) {
                      context.read<ConfirmCodeBloc>().add(
                            PinCodeEvent(
                              code: putController.text,
                              phone: localSource.getPhone().toString(),
                              status: widget.status,
                              onError: () {
                                showTopSnackBar(
                                  Overlay.of(context),
                                  const CustomSnackBar.error(
                                    backgroundColor: AppColors.red,
                                    message:
                                        "Xatolik yuz berdi qaytadan urinib ko'ring",
                                  ),
                                );
                              },
                              onSucces: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RouteNames.main, (route) => false);
                              },
                            ),
                          );
                    } else {
                      AppUtils.showSnackBar(context, "Kod kiritishda xatolik");
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
