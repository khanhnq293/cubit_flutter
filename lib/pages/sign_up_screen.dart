import 'package:bloc_project/common/button.dart';
import 'package:bloc_project/common/snack_bar.dart';
import 'package:bloc_project/common/text_input.dart';
import 'package:bloc_project/common/text_input_pass.dart';
import 'package:bloc_project/cubit/loading_cubit.dart';
import 'package:bloc_project/cubit/user_cubit/user_cubit.dart';
import 'package:bloc_project/main.dart';
import 'package:bloc_project/model/user.dart';
import 'package:bloc_project/pages/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  final void Function(Screens) navigate;
  const SignUpScreen({super.key, required this.navigate});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool isErrorUsername;
  late bool isErrorPassword;
  late bool isErrorConfirmPass;
  late bool isShowErrorConfirmPass;
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conFirmPass = TextEditingController();
  @override
  void initState() {
    isErrorUsername = false;
    isErrorPassword = false;
    isErrorConfirmPass = false;
    isShowErrorConfirmPass = false;
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    pass.dispose();
    conFirmPass.dispose();
    super.dispose();
  }

  void signUpUser(User user) {
    context.read<UserCubit>().signUp(user)
        ? {
            context.read<LoadingCubit>().setUnLoading(),
            context.read<UserCubit>().signIn(user),
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()))
          }
        : ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
            content: const Text("Oh! User already exists"),
            action: SnackBarAction(
                label: "OK",
                textColor: const Color(0xFF80CBC4),
                onPressed: () {}),
          ));

    // SharedPreferencesUser.saveUser(user);
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
    } else if (value.length < 8) {
      return 'At least 8 characters';
    } else if (!pass.text.contains(RegExp(r'[A-Z]'))) {
      return 'At least 1 uppercase letter';
    } else {
      return null;
    }
  }

  String? validateConfirmPass(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 8) {
      return 'At least 8 characters';
    } else if (value != pass.text) {
      return "Doesn't match the password";
    } else {
      return null;
    }
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextInputPass(
                title: "Password",
                value: pass,
                isError: isErrorPassword,
                validate: validatePass,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "*At least 8 characters\n At least 1 uppercase letter",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextInputPass(
                title: "Confirm your password",
                value: conFirmPass,
                isError: isErrorConfirmPass,
                validate: validateConfirmPass,
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: isShowErrorConfirmPass,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Doesn't match the password",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 60),
          AppButton(
              title: "SIGN UP",
              onPress: () => validateButton()
                  ? {
                      context.read<LoadingCubit>().setLoading(),
                      signUpUser(
                          User(userName: userName.text, password: pass.text)),
                      FocusScope.of(context).unfocus(),
                    }
                  : null),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(text: "You have an account."),
              TextSpan(
                  text: "Sign in",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => widget.navigate(Screens.signIn),
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
