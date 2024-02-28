import 'package:flutter/material.dart';
import 'package:provider_mvvm_clean/provider/counter_provider.dart';
import 'package:provider_mvvm_clean/provider/fav_app_provider.dart';
import 'package:provider_mvvm_clean/provider/slider_provider.dart';
import 'package:provider_mvvm_clean/screen/counter_example.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_clean/screen/fav_app_screen.dart';
import 'package:provider_mvvm_clean/screen/slider_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavAppProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FavAppScreen(),
      ),
    );
  }
}
