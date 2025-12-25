

import 'package:equatable/equatable.dart';





class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final bool isChecked;

  const LoginButtonPressed({
    required this.email,
    required this.password,
    required this.isChecked,
  });
}



abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoadInitialData extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class CheckboxChanged extends LoginEvent {
  final bool value;
  const CheckboxChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class LoginPressed extends LoginEvent {}



