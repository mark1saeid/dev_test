import 'package:dev_test/layers/presentation/auth/cubit/login_cubit.dart';
import 'package:dev_test/layers/presentation/auth/cubit/state.dart';
import 'package:dev_test/core/helpers/colors.dart';
import 'package:dev_test/core/helpers/painters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        bloc: LoginCubit.get(context),
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              CustomPaint(
                painter: WaveBackgroundPainter(),
                child: Container(height: 200),
              ),
              CustomPaint(
                painter: WavePainter(),
                child: Container(height: 200),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 1),
                      const Text(
                        'Daily Flow',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: mainColor,
                      ),
                      Spacer(),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            hoverColor: mainColor,
                            overlayColor: WidgetStateProperty.all(mainColor),
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text('Remember me'),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?',
                                style: TextStyle(color: mainColor)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LoginCubit.get(context).login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text('Sign In',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
