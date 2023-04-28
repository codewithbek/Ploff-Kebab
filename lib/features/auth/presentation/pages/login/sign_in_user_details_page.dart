import 'package:ploff_kebab/export_files.dart';

class EnterDetailPage extends StatefulWidget {
  const EnterDetailPage({Key? key}) : super(key: key);

  @override
  State<EnterDetailPage> createState() => _EnterDetailPageState();
}

class _EnterDetailPageState extends State<EnterDetailPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: AppUtils.kPaddingHor16Ver12,
              child: Text(
                "Enter your details",
                style: AppTextsyles.w300,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: AppUtils.kPaddingAll16,
        children: [
          // CustomTextField(
          //   contentPadding: const EdgeInsets.all(14),
          //   controller: nameController,
          //   labelText: 'First name',
          //   onChanged: (value) {},
          //   hintText: 'Akbar',
          // ),
          AppUtils.kBoxHeight16,
         AppUtils.kBoxHeight16,
      ],
      ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.white,
        child: SafeArea(
          minimum: AppUtils.kPaddingAll16.copyWith(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: ElevatedButton(
            // onPressed: state.status.isLoading
            //     ? null
            //     : () {
            //   debugPrint("phone number : +${phoneNumberController.text.trim().replaceAll(' ', '')}");
            //   if(state.country?.mask.trim().replaceAll(' ', '').length==phoneNumberController.text.trim().replaceAll(' ', '').length){
            //
            //     context.read<LoginBloc>().add(
            //       SendCodeEvent(
            //         request: SendCodeRequest(
            //           recipient:
            //           '+${phoneNumberController.text.trim().replaceAll(' ', '')}',
            //           text: "",
            //         ),
            //         phoneCode: state.phoneNumber ?? "",
            //       ),
            //     );
            //   }else{
            //     CustomSnackBar.showErrorSnackBar(context: context, message: "Invalid Number");
            //     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid phone number")));
            //   }
            //
            // },
            // style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xffF1F1F1))),
            onPressed: () {
              // Navigator.pushNamed(
              //     rootNavigatorKey.currentContext!, Routes.pinCode);
            },
            child: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600,
                // color: Color(0xffB5B5B5,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
