import 'package:bloc_project/common/button.dart';
import 'package:bloc_project/common/snack_bar.dart';
import 'package:bloc_project/common/text_input.dart';
import 'package:bloc_project/common/text_input_pass.dart';
import 'package:bloc_project/cubit/loading_cubit.dart';
import 'package:bloc_project/cubit/user_cubit/user_cubit.dart';
import 'package:bloc_project/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  late UserCubit userCubit;
  late LoadingCubit loadingCubit;

  @override
  void initState() {
    isErrorUsername = false;
    isErrorPassword = false;
    userCubit = UserCubit();
    loadingCubit = LoadingCubit();
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    pass.dispose();
    super.dispose();
  }

  signInUser(User user) {
    userCubit.signIn(user)
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()))
        : ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
            content: const Text("Oh! account or password is incorrect"),
            action: SnackBarAction(
                label: "OK",
                textColor: const Color(0xFF80CBC4),
                onPressed: () {}),
          ));
    loadingCubit.setUnLoading();
  }

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  bool validateButton() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextInput(
            title: "Username",
            value: userName,
            isError: isErrorUsername,
            validate: validateUserName,
          ),
          const SizedBox(height: 10),
          AppTextInputPass(
            title: "Password",
            value: pass,
            isError: isErrorPassword,
            validate: validatePass,
          ),
          const SizedBox(height: 60),
          AppButton(
              title: "SIGN IN",
              onPress: () => validateButton()
                  ? {
                      loadingCubit.setLoading(),
                      signInUser(
                          User(userName: userName.text, password: pass.text)),
                      FocusScope.of(context).unfocus()
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
      ),
    );
  }
}
