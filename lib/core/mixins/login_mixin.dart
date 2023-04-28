import 'package:flutter/material.dart';

import '../../features/auth/presentation/bloc/login/login_bloc.dart';

mixin LoginMixin {
  late PageController pageController;
  late TextEditingController phoneNumberController;
  late FocusNode phoneNumberFocus;
  late TextEditingController codeController;
  late FocusNode codeFocus;
  int numberLenth=0;

  void initControllers() {
    pageController = PageController();
    phoneNumberController = TextEditingController();
    codeController = TextEditingController();
    phoneNumberFocus = FocusNode();
    codeFocus = FocusNode();
  }

  void pageMovement(LoginState state) {
    switch (state.runtimeType) {
      case LoginPhoneNumberState:
        pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        break;
      case LoginCodeState:
        pageController.animateToPage(1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        break;
    }
  }

  void disposeControllers() {
    pageController.dispose();
    phoneNumberController.dispose();
    codeController.dispose();
    phoneNumberFocus.dispose();
    codeFocus.dispose();
  }
}
