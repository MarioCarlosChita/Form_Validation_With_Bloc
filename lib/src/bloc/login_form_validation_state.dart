import 'package:formz/formz.dart';
import 'package:simple_lesson/src/form/input_validation.dart';

class LoginFormValidationState {

  LoginFormValidationState({
    this.password = const PasswordValition.pure(),
    this.email = const EmailValidation.pure(),
    this.status = FormzStatus.pure
  });

  EmailValidation email;
  PasswordValition password;
  FormzStatus status;


  LoginFormValidationState copyWith({
    EmailValidation? email,
    PasswordValition? password,
    FormzStatus? status
  }){
    return LoginFormValidationState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }

}
