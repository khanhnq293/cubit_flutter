import 'package:bloc_project/common/button.dart';
import 'package:bloc_project/common/text_input.dart';
import 'package:bloc_project/cubit/drinking_cubit/cubit/drinking_cubit.dart';
import 'package:bloc_project/cubit/drinking_cubit/cubit/drinking_state.dart';
import 'package:bloc_project/data/data_drinking.dart';
import 'package:bloc_project/model/drinking.dart';
import 'package:bloc_project/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: BlocBuilder<DrinkingCubit, DrinkingState>(
                bloc: drinkingCubit,
                buildWhen: (previous, current) =>
                    previous.convertStatus != current.convertStatus ||
                    previous.addStatus != current.addStatus ||
                    previous.deleteStatus != current.deleteStatus,
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.drinksMap.length,
                    itemBuilder: (context, index) {
                      return DrinkingItem(
                        drinkingCubit: drinkingCubit,
                        state: state,
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => showDialogAddDrinking(
                    context: context, drinkingCubit: drinkingCubit),
                child: const Text("Add new item")),
          ],
        ),
      ),
    );
  }
}

class DrinkingItem extends StatelessWidget {
  final DrinkingCubit drinkingCubit;
  final DrinkingState state;
  final int index;
  const DrinkingItem(
      {super.key,
      required this.drinkingCubit,
      required this.state,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.coffee),
        title: Text(
          state.drinksMap.values.elementAt(index).drinkingName,
        ),
        trailing: IconButton(
            onPressed: () => showAlertDialog(
                context, "Delete", "Do you want to delete this item?",
                onPress: () => drinkingCubit
                    .deleteDrinking(state.drinksMap.keys.elementAt(index))),
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            )),
      ),
    );
  }
}

Future showDialogAddDrinking(
    {required BuildContext context, required DrinkingCubit drinkingCubit}) {
  TextEditingController drinking = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextInput(title: 'Drink', value: drinking),
            const SizedBox(height: 20),
            AppButton(
                title: "Add",
                onPress: () {
                  drinkingCubit.addDrinking([
                    Drinking(
                        id: const Uuid().v4(),
                        drinkingName: drinking.text,
                        sugar: 50,
                        ice: 50)
                  ]);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    ),
  );
}
