import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_wave/features/counter/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                log(state.toString());

                return Text(
                  state.count.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterIncrementEvent());
                  },
                  child: Text("Increment"),
                ),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterDecrementEvent());
                  },
                  child: Text("Decrement"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
