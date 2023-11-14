import 'package:bloc_project/cubit/todo_dart_cubit.dart';
import 'package:bloc_project/cubit/user_cubit.dart';
import 'package:bloc_project/cubit/users_cubit.dart';
import 'package:bloc_project/layout/layout_authentic.dart';
import 'package:bloc_project/pages/sign_in_screen.dart';
import 'package:bloc_project/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

enum Screens { signIn, signUp }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(create: (_) => UsersCubit()),
          BlocProvider(create: (_) => TodoDartCubit())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(useMaterial3: true),
            home: const TemplateAuthentic()));
  }
}

class TemplateAuthentic extends StatefulWidget {
  const TemplateAuthentic({super.key});

  @override
  State<TemplateAuthentic> createState() => _TemplateAuthenticState();
}

class _TemplateAuthenticState extends State<TemplateAuthentic> {
  Screens screen = Screens.signIn;
  Widget getAuthScreen() {
    switch (screen) {
      case Screens.signIn:
        return SignInScreen(
          navigate: navigate,
        );
      case Screens.signUp:
        return SignUpScreen(navigate: navigate);
    }
  }

  void navigate(Screens value) {
    setState(() {
      screen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutAuthentic(
      navigate: navigate,
      child: getAuthScreen(),
    ));
  }
}
