import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              increment(),
              decrement(),
            ],
          ),
          body: Center(child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return counter(state.toString());
            },
          )),
        ),
      ),
    );
  }
}

Widget counter(String data) {
  return Text(
    data,
    style: const TextStyle(fontSize: 45),
  );
}

Widget increment() {
  return BlocBuilder<CounterBloc, int>(
    builder: (context, state) {
      return IconButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterIncEvent());
          },
          icon: const Icon(Icons.plus_one));
    },
  );
}

Widget decrement() {
  return BlocBuilder<CounterBloc, int>(
    builder: (context, state) {
      return IconButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterDecEvent());
          },
          icon: const Icon(Icons.exposure_minus_1_outlined));
    },
  );
}
