import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_clean/provider/counter_provider.dart';
import 'package:provider_mvvm_clean/provider/theme_provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  // void initState() {
  //   final countProvider = Provider.of<CounterProvider>(context, listen: false);
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     countProvider.increment();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print('build');
    final countProvider = Provider.of<CounterProvider>(context);
    // final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ThemeProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                    onTap: () {
                      value.toggleDark();
                      if (value.isDarkMode == false) {
                        value.setTheme(ThemeMode.dark);
                      } else {
                        value.setTheme(ThemeMode.light);
                      }
                    },
                    child: value.themeMode == ThemeMode.light
                        ? const Icon(
                            Icons.light,
                          )
                        : const Icon(
                            Icons.light,
                            color: Colors.yellow,
                          ));
              },
            ),
          )
        ],
        title: const Text('Counter'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  countProvider.increment();
                },
                child: const Icon(Icons.add)),
            const SizedBox(
              width: 20,
            ),
            Center(child: Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text(value.count.toString());
              },
            )),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  countProvider.decrement();
                },
                child: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
