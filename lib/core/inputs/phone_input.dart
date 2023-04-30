import 'package:formz/formz.dart';

enum PhoneInputError { empty, notPhone }

class PhoneInput extends FormzInput<String, PhoneInputError> {
  PhoneInput.pure() : super.pure('');

  PhoneInput.dirty(String value) : super.dirty(value);

  @override
  PhoneInputError? validator(String value) {
    final isPhoneRegEx = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (value.isEmpty) {
      return PhoneInputError.empty;
    } else if (!(isPhoneRegEx.hasMatch(value))) {
      return PhoneInputError.notPhone;
    } else {
      return null;
    }
  }
}
