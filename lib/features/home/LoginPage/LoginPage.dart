import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/core/cubit/auth_cubit.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorManager.ColorNeutralWhite,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: [
                  const SizedBox(height: 65),

                  const Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.ColorNeutralPrimary,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Your work faster and structured with Todayapp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorManager.ColorNeutralSecondary,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.ColorNeutralPrimary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  TextField(
                    controller: _emailController,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontSize: 24,
                        color: ColorManager.ColorNeutralGhost,
                      ),
                      filled: true,
                      fillColor: ColorManager.ColorNeutralBackground,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 38,
                        vertical: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 15,
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
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 38,
                        vertical: 30,
                      ),
                    ),
                  ),
                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.read<AuthCubit>().register(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        if (!context.mounted) return;

                        context.go('/signin');
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('signin');
                      },
                      child: Text("signin"),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
