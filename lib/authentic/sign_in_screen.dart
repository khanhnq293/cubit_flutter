import 'package:bloc_project/authentic/home_screen.dart';
import 'package:bloc_project/common/button.dart';
import 'package:bloc_project/common/text_input.dart';
import 'package:bloc_project/common/text_input_pass.dart';
import 'package:bloc_project/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BodySignUp(username: email, pass: pass);
  }
}

class BodySignUp extends StatefulWidget {
  final TextEditingController username;
  final TextEditingController pass;

  const BodySignUp({super.key, required this.username, required this.pass});

  @override
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> with TickerProviderStateMixin {
  late bool isErrorUsername;
  late bool isErrorPassword;
  late bool _isLoading;
  @override
  void initState() {
    isErrorUsername = false;
    isErrorPassword = false;
    _isLoading = false;
    super.initState();
  }

  void registerUser(user) {
    context.read<UserCubit>().signUp(user);
  }

  void validatePassword() {
    if (widget.pass.text.isEmpty) {
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
    if (widget.username.text.isEmpty) {
      setState(() {
        isErrorUsername = true;
      });
    } else {
      setState(() {
        isErrorUsername = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background_animal.png"),
                      fit: BoxFit.fill))),
          SafeArea(
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 2))
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextInput(
                      title: "Username",
                      value: widget.username,
                      isError: isErrorUsername,
                      valueChange: validateUsername,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextInputPass(
                          title: "Password",
                          value: widget.pass,
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
                        onPress: (widget.username.text.isNotEmpty &&
                                widget.pass.text.isNotEmpty &&
                                widget.pass.text.length > 7)
                            ? () {
                                setState(() {
                                  _isLoading = true;
                                });
                                registerUser(User(
                                    widget.username.text, widget.pass.text));
                                FocusScope.of(context).unfocus();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              }
                            : null)
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isLoading,
            child: Container(
                alignment: Alignment.center,
                color: Colors.black26,
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.white70,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF80CBC4)),
                )),
          )
        ],
      ),
    );
  }
}
