import 'package:bloc_project/common/button.dart';
import 'package:bloc_project/common/snack_bar.dart';
import 'package:bloc_project/common/text_input.dart';
import 'package:bloc_project/common/text_input_pass.dart';
import 'package:bloc_project/cubit/loading_cubit.dart';
import 'package:bloc_project/cubit/user_cubit.dart';
import 'package:bloc_project/cubit/users_cubit.dart';
import 'package:bloc_project/main.dart';
import 'package:bloc_project/shared_preferences/shared_user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  final void Function(Screens) navigate;
  const SignInScreen({super.key, required this.navigate});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool isErrorUsername;
  late bool isErrorPassword;
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final snackBar = SnackBar(
    content: const Text('Oh! Account or password is incorrect'),
    action: SnackBarAction(
      label: 'OK',
      textColor: const Color(0xFF80CBC4),
      onPressed: () {},
    ),
  );

  @override
  void initState() {
    isErrorUsername = false;
    isErrorPassword = false;
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    pass.dispose();
    super.dispose();
  }

  Future<void> signInUser(User user) async {
    List<User> users = context.read<UsersCubit>().getUsers();
    for (User element in users) {
      if (user.userName == element.userName &&
          user.password == element.password) {
        context.read<UserCubit>().signIn(user);
        context.read<LoadingCubit>().setUnLoading();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));

        SharedPreferencesUser.saveUser(user);
        return;
      }
    }
    context.read<LoadingCubit>().setUnLoading();
    ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
      content: const Text("Oh! account or password is incorrect"),
      action: SnackBarAction(
          label: "OK", textColor: const Color(0xFF80CBC4), onPressed: () {}),
    ));
  }

  void validatePassword() {
    if (pass.text.length < 8) {
      setState(() {
        isErrorPassword = true;
      });
    } else {
      setState(() {
        isErrorPassword = false;
      });
    }
  }

  void validateUsername() {
    if (userName.text.isEmpty) {
      setState(() {
        isErrorUsername = true;
      });
    } else {
      setState(() {
        isErrorUsername = false;
      });
    }
  }

  bool validateButton() {
    if (userName.text.isEmpty || pass.text.length < 8) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextInput(
          title: "Username",
          value: userName,
          isError: isErrorUsername,
          valueChange: validateUsername,
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextInputPass(
              title: "Password",
              value: pass,
              isError: isErrorPassword,
              valueChange: validatePassword,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "*At least 8 characters",
                style: TextStyle(color: Colors.grey[700]),
              ),
            )
          ],
        ),
        const SizedBox(height: 60),
        AppButton(
            title: "SIGN IN",
            onPress: validateButton()
                ? () async {
                    context.read<LoadingCubit>().setLoading();
                    signInUser(User(userName.text, pass.text));
                    FocusScope.of(context).unfocus();
                  }
                : null),
        const SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: RichText(
              text: TextSpan(children: [
            const TextSpan(text: "You don't have an account."),
            TextSpan(
                text: "Sign up",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => widget.navigate(Screens.signUp),
                style: const TextStyle(
                    color: Color(0xFF004D40),
                    decoration: TextDecoration.underline)),
          ])),
        )
      ],
    );
  }
}
