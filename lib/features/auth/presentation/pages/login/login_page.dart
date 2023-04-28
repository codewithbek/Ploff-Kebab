import 'package:ploff_kebab/core/mixins/login_mixin.dart';
import 'package:ploff_kebab/core/widgets/custom_text_field.dart';
import 'package:ploff_kebab/core/widgets/masked_text_input_formatter.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  @override
  void initState() {
    initControllers();
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    // final localization = AppLocalization.of(context);
    // final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppUtils.kGap24,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Text(
              "Your Phone Number",
              style: AppTextsyles.w600.copyWith(fontSize: 24.sp),
            ),
          ),
          AppUtils.kGap40,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Text(
              "Phone number",
              style: AppTextsyles.w400.copyWith(fontSize: 15.sp),
            ),
          ),
          AppUtils.kGap6,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: CustomTextField(
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
              controller: phoneNumberController,
              onChanged: (value) {
                setState(() {
                  numberLenth = value.trim().replaceAll(" ", "").length;
                });
              },
              textInputType: TextInputType.number,
              prefixText: "+998 ",
              prefixTextStyle:
                  TextStyle(color: AppColors.black1, fontSize: 15.sp),
              fillColor: AppColors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.cFFCC00)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.cFFCC00),
              ),
            ),
          ),
          AppUtils.kSpacer,
          SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: PrimaryButtonWidget(
                text: "Procced",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.register);
                }),
          )
        ],
      ),
    );
    // return BlocListener<LoginBloc, LoginState>(
    //   listener: (context, state) {
    //     pageMovement(state);
    //   },
    //   listenWhen: (previous, current) =>
    //       previous.runtimeType != current.runtimeType,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       elevation: 0,
    //     ),
    //     body: PageView(
    //       controller: pageController,
    //       children: [
    //         PhoneNumberSubPage(
    //           focusNode: phoneNumberFocus,
    //           controller: phoneNumberController,
    //           onPhoneNumberChanged: (phone) {
    //             context.read<LoginBloc>().add(
    //                   LoginEnterPhoneNumberEvent(phoneNumber: phone),
    //                 );
    //           },
    //           onFieldSubmitted: (phone) {
    //             context.read<LoginBloc>().add(
    //                   LoginPhoneButtonPressedEvent(phoneNumber: phone),
    //                 );
    //           },
    //         ),
    //         Container(
    //           color: Colors.blue,
    //         ),
    //       ],
    //     ),
    //     bottomNavigationBar: SafeArea(
    //       minimum: EdgeInsets.only(
    //         bottom: mediaQuery.viewInsets.bottom + 16,
    //         left: 16,
    //         right: 16,
    //         top: 16,
    //       ),
    //       child: BlocBuilder<LoginBloc, LoginState>(
    //         builder: (context, state) {
    //           return ElevatedButton(
    //             onPressed: state.onPressed(
    //               context,
    //               phoneNumberController.text,
    //               codeController.text,
    //             ),
    //             child: Text(state is LoginPhoneNumberState
    //                 ? localization.confirm_phone_number
    //                 : localization.next),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}

extension LoginStateX on LoginState {
  Function()? onPressed(BuildContext context, [String? phone, String? code]) {
    switch (runtimeType) {
      case LoginPhoneNumberState:
        if ((this as LoginPhoneNumberState).phoneNumber.isNotEmpty) {
          return () {
            context.read<LoginBloc>().add(
                  LoginPhoneButtonPressedEvent(
                    phoneNumber: phone ?? '',
                  ),
                );
          };
        } else {
          return null;
        }
      case LoginCodeState:
        if ((this as LoginCodeState).code.isNotEmpty) {
          return () {
            context.read<LoginBloc>().add(
                  LoginCodeButtonPressedEvent(
                    code: code ?? '',
                  ),
                );
          };
        } else {
          return null;
        }
      default:
        return null;
    }
  }
}
