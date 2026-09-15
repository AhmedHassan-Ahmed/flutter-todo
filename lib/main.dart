import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/MyApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_todolist/core/cubit/auth_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(BlocProvider(create: (_) => AuthCubit(), child: MyApp()));
}
