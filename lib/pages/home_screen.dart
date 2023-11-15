import 'package:bloc_project/common/button.dart';
import 'package:bloc_project/common/text_input.dart';
import 'package:bloc_project/cubit/todo_dart_cubit.dart';
import 'package:bloc_project/main.dart';
import 'package:bloc_project/shared_preferences/shared_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/home_screen/header_bar.dart';
import '../components/home_screen/item_doing.dart';
import '../model/doing.dart';

enum Options {
  update('Update'),
  delete('Delete');

  final String name;

  const Options(this.name);
}

enum ActionsDoing { add, update }

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF80CBC4),
          elevation: 2,
          title: const HeaderBar(),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == "0") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                  SharedPreferencesUser.clearUser();
                }
              },
              color: Colors.white,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "0",
                  child: Text('Log out', style: TextStyle(color: Colors.red)),
                )
              ],
            ),
          ]),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          width: double.infinity,
          child: BlocBuilder<TodoDartCubit, List<Doing>>(
            builder: (context, state) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ItemDoing(
                          index: index,
                          createAtTime: context
                              .read<TodoDartCubit>()
                              .getDoings()[index]
                              .createAtTime,
                          isChecked: context
                              .read<TodoDartCubit>()
                              .getDoings()[index]
                              .isDone,
                          title: context
                              .read<TodoDartCubit>()
                              .getDoings()[index]
                              .name);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(color: Colors.greenAccent);
                    },
                    itemCount: context.read<TodoDartCubit>().getStateLength()),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF80CBC4),
          onPressed: () async {
            showInputDialog(context, "Add something", "Add",
                actions: ActionsDoing.add);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

Future showInputDialog(
    BuildContext context, String titleDialog, String textButton,
    {required ActionsDoing actions, int? index}) {
  TextEditingController doSomeThing = TextEditingController();
  void actionFunction(value) {
    switch (value) {
      case ActionsDoing.add:
        context
            .read<TodoDartCubit>()
            .addDoing(Doing(doSomeThing.text, false, DateTime.now()));
        Navigator.pop(context);
        return;
      case ActionsDoing.update:
        context.read<TodoDartCubit>().updateDoingTitle(
            index ?? 0,
            Doing(
                doSomeThing.text,
                false,
                context
                    .read<TodoDartCubit>()
                    .getDoings()
                    .elementAt(index ?? 0)
                    .createAtTime));
        Navigator.pop(context);
        return;
      default:
        Navigator.pop(context);
    }
  }

  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color(0xFF80CBC4),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(titleDialog,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AppTextInput(title: "Something", value: doSomeThing),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AppButton(
                    title: textButton, onPress: () => actionFunction(actions)),
              )
            ],
          ),
        ));
      });
}

Future showAlertDialog(BuildContext context, String title, String description,
    {required VoidCallback onPress}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(children: [
            const Icon(Icons.delete_outline_outlined, color: Colors.white),
            Text(title, style: const TextStyle(color: Colors.white))
          ]),
          backgroundColor: const Color(0xFF80CBC4),
          content:
              Text(description, style: const TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () => onPress.call(),
              child:
                  const Text('OK', style: TextStyle(color: Color(0xFF80CBC4))),
            ),
          ],
        );
      });
}
