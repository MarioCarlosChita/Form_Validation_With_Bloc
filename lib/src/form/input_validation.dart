import 'package:formz/formz.dart';
import 'package:simple_lesson/core/extensions/email_extension.dart';

enum EmailValidationType { Empty, Email }

enum PasswordValidationType { Empty, IstooShort }

class EmailValidation extends FormzInput<String, EmailValidationType> {
  const EmailValidation.pure() : super.pure("");
  const EmailValidation.dirty({String value =""}) : super.dirty(value);

  @override
  EmailValidationType? validator(String value) {
    if (value.isEmpty) return EmailValidationType.Empty;

    if (!InputValidation.isValidEmail(input: value)) {
      return EmailValidationType.Email;
    }
    return null;
  }
}

class PasswordValition extends FormzInput<String, PasswordValidationType> {
  const PasswordValition.dirty({String value = ''}) : super.dirty(value);
  const  PasswordValition.pure() : super.pure('');

  @override
  PasswordValidationType? validator(String value) {
    if (value.isEmpty) return PasswordValidationType.Empty;
    if (value.length < 6) return PasswordValidationType.IstooShort;
    return null;
  }
}
