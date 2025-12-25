import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadInitialData>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2)); // fake API
      emit(
        state.copyWith(
          isPageLoading: false,
          staticText: "Welcome! This data came from BLoC",
        ),
      );
    });
    on<EmailChanged>(_onEmailChanged);
    on<CheckboxChanged>(_onCheckboxChanged);
    on<LoginPressed>(_onLoginPressed);
  }

  // Future<void> _onLoadInitialData(
  //     LoadInitialData event,
  //     Emitter<LoginState> emit,
  //     ) async {
  //   await Future.delayed(const Duration(seconds: 2)); // fake API
  //   emit(
  //     state.copyWith(
  //       isPageLoading: false,
  //       staticText: "Welcome! This data came from BLoC",
  //     ),
  //   );
  // }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    // emit(state.copyWith(email: event.email, errorMessage: null));
    emit(state.copyWith(email: event.email, errorMessage: null));
  }

  void _onCheckboxChanged(CheckboxChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(isChecked: event.value, errorMessage: null));
  }

  Future<void> _onLoginPressed(
    LoginPressed event,
    Emitter<LoginState> emit,
  ) async {
    if (state.email.isEmpty) {
      emit(state.copyWith(errorMessage: "Email cannot be empty"));
      return;
    }

    if (!state.isChecked) {
      emit(state.copyWith(errorMessage: "Please accept terms"));
      return;
    }

    emit(state.copyWith(isButtonLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    print("📧 Email: ${state.email}");
    print("☑️ Checkbox: ${state.isChecked}");

    emit(state.copyWith(isButtonLoading: false));
  }
}
