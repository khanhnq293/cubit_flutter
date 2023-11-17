import 'package:bloc_project/cubit/loading_cubit.dart';
import 'package:bloc_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutAuthentic extends StatefulWidget {
  final Widget child;
  final void Function(Screens) navigate;
  final bool isLoading;
  const LayoutAuthentic(
      {super.key,
      required this.child,
      required this.navigate,
      this.isLoading = false});

  @override
  State<LayoutAuthentic> createState() => _LayoutAuthenticState();
}

class _LayoutAuthenticState extends State<LayoutAuthentic> {
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
              child: SingleChildScrollView(
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
                      children: [widget.child]),
                ),
              ),
            ),
          ),
          BlocBuilder<LoadingCubit, bool>(
            builder: (context, state) {
              if (state) {
                return Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
