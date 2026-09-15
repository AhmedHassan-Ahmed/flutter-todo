import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/core/cubit/auth_cubit.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
    return Scaffold(
      backgroundColor: ColorManager.ColorNeutralWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              const SizedBox(height: 35),

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

              const SizedBox(height: 5),

              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorManager.ColorNeutralBackground,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 38,
                    vertical: 30,
                  ),
                ),
              ),

              const SizedBox(height: 15),

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

              const SizedBox(height: 5),

              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(fontSize: 15),
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
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    await context.read<AuthCubit>().login(
                      email: email,
                      password: password,
                    );

                    if (!mounted) return;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.ColorBrandprimaryDefault,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorManager.ColorNeutralWhite,
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    context.go('login');
                  },
                  child: Text("login"),
                ),
              ),
              const SizedBox(height: 40),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
