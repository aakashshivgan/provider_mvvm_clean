import 'package:flutter/material.dart';

class StatelessToStatefullScreen extends StatelessWidget {
  StatelessToStatefullScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> obsecure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _counter.value++;
      }),
      appBar: AppBar(
        title: const Text('appbar'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: obsecure,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: obsecure.value,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: InkWell(
                          onTap: () {
                            obsecure.value = !obsecure.value;
                          },
                          child: obsecure.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                ),
              );
            },
          ),
          Center(
              child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                'Counter ${_counter.value}',
                style: const TextStyle(fontSize: 25),
              );
            },
          )),
        ],
      ),
    );
  }
}
