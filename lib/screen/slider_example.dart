import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_clean/provider/slider_provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    print('build');
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer<SliderProvider>(
              builder: (context, value, child) {
                return Slider(
                    min: 0,
                    max: 1,
                    value: value.value,
                    onChanged: (val) {
                      sliderProvider.setValue(val);
                    });
              },
            ),
            Consumer<SliderProvider>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value)),
                    )),
                    Expanded(
                        child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)),
                    ))
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
