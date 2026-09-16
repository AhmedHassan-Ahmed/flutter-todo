import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/core/cubit/auth_cubit.dart';
import 'package:flutter_todolist/core/cubit/auth_state.dart';
import 'package:flutter_todolist/core/styles/Units.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.ColorNeutralWhite,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Units.width(context, 48),
              ),
              child: Column(
                children: [
                  SizedBox(height: Units.height(context, 65)),
                  Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Units.font(context, 30),
                      fontWeight: FontWeight.bold,
                      color: ColorManager.ColorNeutralPrimary,
                    ),
                  ),
                  SizedBox(height: Units.height(context, 5)),
                  Text(
                    'Your work faster and structured with Todayapp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Units.font(context, 15),
                      color: ColorManager.ColorNeutralSecondary,
                    ),
                  ),
                  SizedBox(height: Units.height(context, 15)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: Units.font(context, 15),
                        fontWeight: FontWeight.w500,
                        color: ColorManager.ColorNeutralPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: Units.height(context, 25)),
                  TextField(
                    controller: _emailController,
                    style: TextStyle(fontSize: Units.font(context, 15)),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: Units.font(context, 24),
                        color: ColorManager.ColorNeutralGhost,
                      ),
                      filled: true,
                      fillColor: ColorManager.ColorNeutralBackground,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: Units.width(context, 38),
                        vertical: Units.height(context, 30),
                      ),
                    ),
                  ),
                  SizedBox(height: Units.height(context, 20)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: Units.font(context, 15),
                        fontWeight: FontWeight.w500,
                        color: ColorManager.ColorNeutralPrimary,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorManager.ColorNeutralBackground,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: Units.width(context, 38),
                        vertical: Units.height(context, 30),
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (state is AuthFailedState)
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  SizedBox(
                    width: double.infinity,
                    height: Units.height(context, 90),
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.read<AuthCubit>().register(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        if (!mounted) return;

                        if (state is AuthSuccessState) {
                          context.go('/signin');
                          print('yes');
                        }
                      },
                      child: state is AuthLoadingState
                          ? const CircularProgressIndicator()
                          : const Text('Login'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.go('signin');
                    },
                    child: const Text('signin'),
                  ),
                  SizedBox(height: Units.height(context, 40)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
