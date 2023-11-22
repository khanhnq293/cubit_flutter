import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/checkbox.dart';
import '../../cubit/todo_dart_cubit.dart';
import '../../pages/home_screen.dart';
import 'doing_detail.dart';

class ItemDoing extends StatelessWidget {
  final String title;
  final bool isChecked;
  final int index;
  final DateTime? createAtTime;

  const ItemDoing(
      {super.key,
      this.title = "",
      this.isChecked = false,
      required this.index,
      this.createAtTime});

  void deleteItem(BuildContext context, int index) {
    context.read<TodoDartCubit>().deleteDoing(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DoingDetail(detailInfo: title, index: index))),
        onLongPress: () {
          showMenu(
              context: context,
              color: const Color(0xFF80CBC4),
              position: RelativeRect.fromLTRB(100.0, 160 + (index * 80), 30, 0),
              items: [
                PopupMenuItem(
                  value: Options.update,
                  child: Text(Options.update.name,
                      style: const TextStyle(color: Colors.white)),
                  onTap: () => showInputDialog(
                      context, "Update this item", "Update",
                      actions: ActionsDoing.update, index: index),
                ),
                PopupMenuItem(
                  value: Options.delete,
                  child: Text(Options.delete.name,
                      style: const TextStyle(color: Colors.white)),
                  onTap: () => showAlertDialog(
                      context, "Delete", "Do you want to delete this item?",
                      onPress: () => deleteItem(context, index)),
                ),
              ]);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.work,
                  color: Color(0xFF80CBC4),
                ),
                const SizedBox(width: 10),
                Text(title, style: const TextStyle(fontSize: 18)),
                const Spacer(),
                AppCheckBox(
                    isChecked: isChecked,
                    onChanged: () {
                      context
                          .read<TodoDartCubit>()
                          .updateDoingDone(index, !isChecked);
                    })
              ],
            ),
            Text(
                "${createAtTime?.day}/${createAtTime?.month}/${createAtTime?.year} | ${createAtTime?.hour}:${createAtTime?.minute}")
          ],
        ),
      ),
    );
  }
}
