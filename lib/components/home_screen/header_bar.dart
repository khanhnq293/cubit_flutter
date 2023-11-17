import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/user_cubit/user_cubit.dart';
import '../../model/user.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
              height: 45,
              width: 45,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtRqsbpNzTz8wXYvdqnFq9VRcj5uBoeaM13w&usqp=CAU",
                fit: BoxFit.fill,
              )),
        ),
        const SizedBox(width: 15),
        BlocBuilder<UserCubit, User>(
          buildWhen: (previous, current) =>
          previous.userName != current.userName,
          builder: (context, state) {
            return Column(children: [
              Text("Hello ${state.userName}!",
                  style: const TextStyle(color: Colors.white)),
            ]);
          },
        )
      ],
    );
  }
}