import 'package:bloc_project/common/button.dart';
import 'package:bloc_project/common/snack_bar.dart';
import 'package:bloc_project/common/text_input.dart';
import 'package:bloc_project/common/text_input_pass.dart';
import 'package:bloc_project/cubit/user_cubit.dart';
import 'package:bloc_project/cubit/users_cubit.dart';
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

  void signInUser(User user) {
    List<User> users = context.read<UsersCubit>().getUsers();
    for (User element in users) {
      if (user.userName == element.userName) {
        ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
          content: const Text("Oh! user already exists"),
          action: SnackBarAction(
              label: "OK",
              textColor: const Color(0xFF80CBC4),
              onPressed: () {}),
        ));
        return;
      }
    }
    context.read<UserCubit>().signIn(user);
    context.read<UsersCubit>().signUp(user);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void validatePassword() {
    if (pass.text.isEmpty || pass.text.length < 8) {
      setState(() {
        isErrorPassword = true;
      });
    } else {
      setState(() {
        isErrorPassword = false;
      });
    }
  }

  void validateConfirmPass() {
    if (conFirmPass.text.isEmpty || (conFirmPass.text != pass.text)) {
      setState(() {
        isErrorConfirmPass = true;
        isShowErrorConfirmPass = true;
      });
    } else {
      setState(() {
        isErrorConfirmPass = false;
        isShowErrorConfirmPass = false;
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
    if (pass.text.isEmpty ||
        userName.text.isEmpty ||
        pass.text.length < 8 ||
        conFirmPass.text.isEmpty ||
        (conFirmPass.text != pass.text)) {
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
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextInputPass(
              title: "Confirm your password",
              value: conFirmPass,
              isError: isErrorConfirmPass,
              valueChange: validateConfirmPass,
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
            onPress: validateButton()
                ? () {
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
    );
  }
}
