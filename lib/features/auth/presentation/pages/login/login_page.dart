import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
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

class _LoginPageState extends State<LoginPage> with LoginMixin, CacheMixin {
  @override
  void initState() {
    initControllers();
    super.initState();
  }

  String errorText = "";

  @override
  Widget build(BuildContext context) {
    // final localization = AppLocalization.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: Scaffold(
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
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return SafeArea(
                  minimum: AppUtils.kPaddingAll16,
                  child: PrimaryButtonWidget(
                    text: "Procced",
                    onTap: () async {
                      var phone =
                          phoneNumberController.text.trim().replaceAll(' ', '');
                      context
                          .read<LoginBloc>()
                          .add(LoginSendPhoneNumberEvent(phone: "+998$phone"));
                      if (state.status == FormzSubmissionStatus.success) {
                        context.read<LoginBloc>().add(UserLoginEvent(
                            phone: localSource.getPhone().toString(),
                            tag: "tag"));
                        Navigator.pushNamed(context, RouteNames.confirmCode);
                      }
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
