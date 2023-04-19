import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_clean/provider/counter_provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    final countProvider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.increment();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(child: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Text(value.count.toString());
        },
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // countProvider.increment();
      }),
    );
  }
}
