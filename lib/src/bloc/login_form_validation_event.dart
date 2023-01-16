

abstract  class LoginFormValidationEvent{}

class PasswordChangedEvent extends  LoginFormValidationEvent{
  PasswordChangedEvent({required this.input});
  final String input;
}

class EmailChangedEvent extends LoginFormValidationEvent{
  EmailChangedEvent({required this.input});
  final String input;
}