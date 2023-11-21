import 'package:bloc_project/cubit/drinking_cubit/cubit/drinking_cubit.dart';
import 'package:bloc_project/cubit/loading_cubit.dart';
import 'package:bloc_project/cubit/todo_dart_cubit.dart';
import 'package:bloc_project/cubit/user_cubit/user_cubit.dart';
import 'package:bloc_project/layout/layout_authentic.dart';
import 'package:bloc_project/pages/drinking_screen.dart';
import 'package:bloc_project/pages/home_screen.dart';
import 'package:bloc_project/pages/sign_in_screen.dart';
import 'package:bloc_project/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
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
          BlocProvider(create: (_) => TodoDartCubit()),
          BlocProvider(create: (_) => LoadingCubit()),
          BlocProvider(create: (_) => DrinkingCubit())
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
  late UserCubit userCubit;

  @override
  void initState() {
    userCubit = UserCubit();

    super.initState();
  }

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

  void signIn(user) {
    userCubit.signIn(user);
  }

  bool isAuthentic() {
    if (userCubit.state.userName.isEmpty || userCubit.state.password.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return isAuthentic()
        ? const DrinkingScreen()
        : LayoutAuthentic(navigate: navigate, child: getAuthScreen());
  }
}
