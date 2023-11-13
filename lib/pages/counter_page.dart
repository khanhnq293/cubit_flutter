import 'package:bloc_project/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cubit")),
      body: BlocBuilder<CounterCubit, String>(
          builder: (context, count) => Center(
              child: Text("My number is: $count",
                  style: const TextStyle(fontSize: 40)))),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            child: const Icon(Icons.plus_one),
            onPressed: () => context.read<CounterCubit>().increment()),
        const SizedBox(height: 10),
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () => context.read<CounterCubit>().decrement()),
        const SizedBox(height: 10),
        FloatingActionButton(
            child: const Icon(Icons.clear),
            onPressed: () => context.read<CounterCubit>().clear()),
      ]),
    );
  }
}
