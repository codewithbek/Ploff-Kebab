import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/core/widgets/textfields/custom_text_field.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with CacheMixin {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              "Enter your name",
              style: AppTextsyles.w600.copyWith(fontSize: 24.sp),
            ),
          ),
          AppUtils.kGap40,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Text(
              "Name",
              style: AppTextsyles.w400.copyWith(fontSize: 15.sp),
            ),
          ),
          AppUtils.kGap6,
          Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Form(
              child: CustomTextField(
                controller: nameController,
                onChanged: (value) {},
                textInputType: TextInputType.name,
                hintText: "Please enter your name",
                hintTextStyle:
                    TextStyle(color: AppColors.black2, fontSize: 15.sp),
                fillColor: AppColors.cF0F0F0,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.red)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.cFFCC00)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.cFFCC00),
                ),
              ),
            ),
          ),
          AppUtils.kSpacer,
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return SafeArea(
                minimum: AppUtils.kPaddingAll16,
                child: PrimaryButtonWidget(
                    text: "Continue",
                    onTap: () {
                      if (nameController.text.isNotEmpty) {
                        context.read<RegisterBloc>().add(
                              RegisterButtonPressed(
                                  name: nameController.text,
                                  phone: localSource.getPhone().toString(),
                                  registrationSource: "app",
                                  tag: ""),
                            );
                        Navigator.pushNamed(
                          context,
                          RouteNames.confirmCode,
                          arguments: ConfirmStatus.register,
                        );
                      } else {
                        AppUtils.showSnackBar(
                            context, "Ism kiritishda xatolik");
                      }
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
