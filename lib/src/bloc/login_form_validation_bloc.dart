import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:simple_lesson/src/bloc/login_form_validation_event.dart';
import 'package:simple_lesson/src/bloc/login_form_validation_state.dart';
import '../form/input_validation.dart';


class LoginFormValidationBloc  extends Bloc<LoginFormValidationEvent, LoginFormValidationState> {
  LoginFormValidationBloc() : super(LoginFormValidationState()) {
    on<EmailChangedEvent>(_onEmailValidation);
    on<PasswordChangedEvent>(_onPasswordValidation);
  }

  _onEmailValidation(EmailChangedEvent event, Emitter<LoginFormValidationState> emitter) {
    final EmailValidation email = EmailValidation.dirty(value: event.input);

    emit(
        state.copyWith(
        email: email.valid ? email : const EmailValidation.pure(),
        status: Formz.validate([
          state.password,
          email
        ]))
    );
  }
  _onPasswordValidation(PasswordChangedEvent event ,Emitter<LoginFormValidationState> emitter){
    final PasswordValition  password = PasswordValition.dirty(value:event.input);
    emit(
      state.copyWith(
        password: password.valid ? password: const PasswordValition.pure(),
        status: Formz.validate([state.email,password])
      )
    );
  }
}
