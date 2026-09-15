import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<User?> {
  AuthCubit() : super(null);

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
    emit(result.user);
  }

  Future<void> login({required String email, required String password}) async {
    final user = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final token = await user.user!.getIdToken();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
    emit(user.user);
  }

  Future<void> logout() async {
    await auth.signOut();

    emit(null);
  }

  Future<void> gettoken() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('firebase_token');

    print(token);
  }
}
