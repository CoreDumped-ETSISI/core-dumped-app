import 'package:animate_gradient/animate_gradient.dart';
import 'package:coredumpedapp/bloc/auth/auth_bloc.dart';
import 'package:coredumpedapp/utils/custom_snackbar.dart';
import 'package:coredumpedapp/widgets/custom_button.dart';
import 'package:coredumpedapp/widgets/custom_textfield.dart';
import 'package:coredumpedapp/widgets/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Stack(children: [
        AnimateGradient(primaryColors: const [
          Color(0xff42b351),
          Color(0xFFADDFA9),
          Color(0XFFded3ee),
          Color(0Xffffffeb),
        ], secondaryColors: const [
          Color(0Xffffffeb),
          Color(0XFFded3ee),
          Color(0xFFADDFA9),
          Color(0xff42b351),
        ]),
        SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is Authenticated) {
                    Get.offNamed('/home');
                    showCustomSnackbar(
                      'Welcome back!',
                      'You have successfully logged in.',
                      SnackPosition.TOP,
                      Colors.greenAccent,
                      const Icon(Icons.check, color: Colors.white),
                    );
                  } else if (state is AuthError) {
                    showCustomSnackbar(
                      state.errorType,
                      state.errorMessage ?? '',
                      SnackPosition.TOP,
                      Colors.redAccent,
                      const Icon(Icons.error, color: Colors.white),
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Username',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.green[600]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      onTap: () {
                        authBloc.add(SignInRequested(
                            emailController.text, passwordController.text));
                      },
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.green[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.green[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.green[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(imagePath: 'assets/images/google.png'),
                        SizedBox(width: 25),
                        SquareTile(imagePath: 'assets/images/apple.png')
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
