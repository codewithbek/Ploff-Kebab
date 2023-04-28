import 'package:ploff_kebab/core/constants/constants.dart';
import 'package:ploff_kebab/core/inputs/email_input.dart';
import 'package:ploff_kebab/core/inputs/name_input.dart';
import 'package:ploff_kebab/core/inputs/password_input.dart';
import 'package:ploff_kebab/features/auth/presentation/bloc/register_bloc/register_bloc.dart';

mixin RegisterValidation {
  Map<RegisterInputErrors, String>? validateRegister(
    NameInput name,
    EmailInput phone,
  ) {
    if (name.error == null && phone.error == null) {
      return null;
    }
    final isValidFirstName = firstNameValidation(name);
    if (isValidFirstName != null) {
      return isValidFirstName;
    }

    final isValidPhone = phoneValidation(phone);
    if (isValidPhone != null) {
      return isValidPhone;
    } else {
      return null;
    }
  }

  Map<RegisterInputErrors, String>? passwordsMatch(
    String password,
    String confirmPassword,
  ) {
    if (password != confirmPassword) {
      return {};
    } else {
      return null;
    }
  }

  Map<RegisterInputErrors, String>? firstNameValidation(NameInput firstName) {
    switch (firstName.error) {
      case NameInputError.empty:
        return {RegisterInputErrors.name: Validations.FIRSTNAME_EMPTY};
      case NameInputError.short:
        return {RegisterInputErrors.name: Validations.FIRSTNAME_SHORT};
      case NameInputError.long:
        return {RegisterInputErrors.name: Validations.FIRSTNAME_LONG};
      default:
        return null;
    }
  }

  Map<RegisterInputErrors, String>? phoneValidation(EmailInput email) {
    switch (email.error) {
      case EmailInputError.empty:
        return {RegisterInputErrors.phone: Validations.EMAIL_EMPTY};
      case EmailInputError.notEmail:
        return {RegisterInputErrors.phone: Validations.NOT_EMAIL};
      default:
        return null;
    }
  }
}
