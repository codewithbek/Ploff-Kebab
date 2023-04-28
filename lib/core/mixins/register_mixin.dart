import 'package:flutter/cupertino.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register_bloc/register_bloc.dart';

mixin RegisterMixin {
  late TextEditingController firstNameController;
  late FocusNode firstNameFocus;
  late TextEditingController lastNameController;
  late FocusNode lastNameFocus;
  late TextEditingController emailController;
  late FocusNode emailFocus;
  late TextEditingController passwordController;
  late FocusNode passwordFocus;
  late TextEditingController confirmPasswordController;
  late FocusNode confirmPasswordFocus;

  void initTextControllers() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameFocus = FocusNode();
    lastNameFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();
  }

  void disposeTextControllers() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
  }

  void requestFocusNode(RegisterInputErrors? errors) {
    switch (errors) {
      case RegisterInputErrors.name:
        firstNameFocus.requestFocus();
        break;

      case RegisterInputErrors.phone:
        emailFocus.requestFocus();
        break;

      default:
    }
  }
}
