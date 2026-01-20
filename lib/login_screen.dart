import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_screen.dart';
import 'login/login_bloc.dart';
import 'login/login_event.dart';
import 'login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(LoadInitialData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {

          print("1 ${!state.isButtonLoading}");
          print("2 ${state.errorMessage == null}");
          print("3 ${state.email.isNotEmpty}");
          print("4 ${state.isChecked}");



          if (state.isLoginSuccess) {
            print("Navigate");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          }
        },
        builder: (context, state) {
          if (state.isPageLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.staticText, style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 20),

                TextField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) =>
                      context.read<LoginBloc>().add(EmailChanged(v)),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(
                      value: state.isChecked,
                      onChanged: (v) => context.read<LoginBloc>().add(
                        CheckboxChanged(v ?? false),
                      ),
                    ),
                    const Text("Accept Terms"),
                  ],
                ),

                if (state.errorMessage != null)
                  Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.isButtonLoading
                        ? null
                        : () => context.read<LoginBloc>().add(LoginPressed()),
                    child: state.isButtonLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text("Login"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
