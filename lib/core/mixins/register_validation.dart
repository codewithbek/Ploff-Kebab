import 'package:ploff_kebab/core/constants/constants.dart';
import 'package:ploff_kebab/core/inputs/name_input.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/auth_bloc.dart';

mixin RegisterValidation {
  Map<RegisterInputError, String>? validateRegister(
    NameInput name,
  ) {
    if (name.error == null) {
      return null;
    }
    final isValidFirstName = firstNameValidation(name);
    if (isValidFirstName != null) {
      return isValidFirstName;
    }
    return null;
  }

  // Map<RegisterInputError, String>? passwordsMatch(
  //   String password,
  //   String confirmPassword,
  // ) {
  //   if (password != confirmPassword) {
  //     return {};
  //   } else {
  //     return null;
  //   }
  // }

  Map<RegisterInputError, String>? firstNameValidation(NameInput firstName) {
    switch (firstName.error) {
      case NameInputError.empty:
        return {RegisterInputError.name: Validations.NAME_EMPTY};
      case NameInputError.short:
        return {RegisterInputError.name: Validations.NAME_SHORT};
      case NameInputError.long:
        return {RegisterInputError.name: Validations.NAME_LONG};
      default:
        return null;
    }
  }

  // Map<RegisterInputErrors, String>? phoneValidation(PhoneInput email) {
  //   switch (email.error) {
  //     case PhoneInputError.empty:
  //       return {RegisterInputErrors.phone: Validations.PHONE_EMPTY};
  //     case PhoneInputError.notPhone:
  //       return {RegisterInputErrors.phone: Validations.NOT_PHONE};
  //     default:
  //       return null;
  //   }
  // }
}
