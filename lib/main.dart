import 'package:bloc_project/cubit/todo_dart_cubit.dart';
import 'package:bloc_project/cubit/user_cubit.dart';
import 'package:bloc_project/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => TodoDartCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(useMaterial3: true),
        home: const SignInScreen(),
      ),
    );
  }
}
