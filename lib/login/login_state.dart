// part of 'login_bloc.dart';
//
// @immutable
// abstract class LoginState extends Equatable {
//   late final bool isChecked;
//
//   // @override
//   // // TODO: implement props
//   // List<Object?> get props => [];
//
//   @override
//   List<Object> get props => [isChecked];  // yaha define krna jaruru h
// }
//
// final class LoginInitial extends LoginState {
//   final bool isChecked;
//
//   LoginInitial({this.isChecked = false});
// }
//
// class LoginLoading extends LoginState {
//   final bool isChecked;
//
//   LoginLoading(this.isChecked);
// }
//
// class LoginSuccess extends LoginState {
//   final bool isChecked;
//   final String msg;
//
//   LoginSuccess(this.isChecked,  this.msg);
// }
//
// class LoginFailure extends LoginState {
//   final String message;
//   final bool isChecked;
//
//   LoginFailure(this.message, this.isChecked);
// }
//
// class LoginDataLoading extends LoginState {}
//
// class LoginDataLoaded extends LoginState {
//   final String loadedData;
//
//   LoginDataLoaded(this.loadedData);
// }
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isPageLoading; // full screen loader
  final bool isButtonLoading; // button loader
  final String staticText; // fake API data
  final String email;
  final bool isChecked;
  final String? errorMessage;

  const LoginState({
    this.isPageLoading = true,
    this.isButtonLoading = false,
    this.staticText = '',
    this.email = '',
    this.isChecked = false,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? isPageLoading,
    bool? isButtonLoading,
    String? staticText,
    String? email,
    bool? isChecked,
    String? errorMessage,
  }) {
    return LoginState(
      isPageLoading: isPageLoading ?? this.isPageLoading,
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
      staticText: staticText ?? this.staticText,
      email: email ?? this.email,
      isChecked: isChecked ?? this.isChecked,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isPageLoading,
    isButtonLoading,
    staticText,
    email,
    isChecked,
    errorMessage,
  ];
}

class Ravi {
  final int a;

  Ravi({this.a = 1});

  Ravi copyWith({int? a}) {
    return Ravi(a: a ?? this.a);
  }
}

class Signup {
  final int age;

  Signup({required this.age});

  Signup copyWith({int? age}) {
    return Signup(age: age ?? this.age);
  }
}
