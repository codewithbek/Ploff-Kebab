import 'package:flutter/cupertino.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register/register_bloc.dart';

mixin RegisterMixin {
  late TextEditingController nameController;
  late FocusNode nameFocus;
  late TextEditingController phoneController;
  late FocusNode phoneFocus;
  void initTextControllers() {
    nameController = TextEditingController();
    phoneController = TextEditingController();

    nameFocus = FocusNode();
    phoneFocus = FocusNode();
  }

  void disposeTextControllers() {
    nameController.dispose();
    phoneController.dispose();

    nameFocus.dispose();
    phoneFocus.dispose();
  }

  void requestFocusNode(RegisterInputsErrors? errors) {
    switch (errors) {
      case RegisterInputsErrors.name:
        nameFocus.requestFocus();
        break;

      case RegisterInputsErrors.phone:
        phoneFocus.requestFocus();
        break;

      default:
    }
  }
}
