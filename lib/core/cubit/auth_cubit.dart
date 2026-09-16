import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/core/cubit/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    final result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final token = await result.user!.getIdToken();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
    emit(AuthSuccessState());
  }

  Future<bool> login({required String email, required String password}) async {
    emit(AuthLoadingState());

    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final token = await result.user!.getIdToken();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('firebase_token', token!);

      emit(AuthSuccessState());

      return true;
    } on FirebaseAuthException catch (e) {
      emit(AuthFailedState(message: e.message ?? e.code));
      return false;
    }
  }

  Future<void> logout() async {
    await auth.signOut();

    emit(AuthSuccessState());
  }

  Future<void> gettoken() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('firebase_token');

    print(token);
  }
}
