import 'package:bloc_project/cubit/drinking_cubit/cubit/drinking_cubit.dart';
import 'package:bloc_project/cubit/drinking_cubit/cubit/drinking_state.dart';
import 'package:bloc_project/data/data_drinking.dart';
import 'package:bloc_project/model/drinking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkingScreen extends StatefulWidget {
  const DrinkingScreen({super.key});

  @override
  State<DrinkingScreen> createState() => _DrinkingScreenState();
}

class _DrinkingScreenState extends State<DrinkingScreen> {
  late DrinkingCubit drinkingCubit;
  @override
  void initState() {
    super.initState();
    drinkingCubit = DrinkingCubit();
    drinkingCubit.convertList(drinkings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<DrinkingCubit, DrinkingState>(
            buildWhen: (previous, current) =>
                previous.convertStatus != current.convertStatus ||
                previous.addStatus != current.addStatus ||
                previous.deleteStatus != current.deleteStatus,
            builder: (context, state) {
              print('${state.drinksMap.length}');
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.drinksMap.length,
                itemBuilder: (context, index) {
                  return Text(
                    state.drinksMap.keys.elementAt(index),
                  );
                },
              );
            },
          ),
          ElevatedButton(
              onPressed: () => drinkingCubit.addDrinking(
                    Drinking(
                      id: "9",
                      drinkingName: "cocacola",
                      sugar: 90,
                      ice: 90,
                    ),
                  ),
              child: const Text("Add new item")),
          ElevatedButton(
              onPressed: () => drinkingCubit.deleteDrinking("9"),
              child: const Text("Delete an item"))
        ],
      ),
    );
  }
}
