import 'package:flutter/material.dart';
import 'package:provider_mvvm_clean/provider/counter_provider.dart';
import 'package:provider_mvvm_clean/provider/theme_provider.dart';
import 'package:provider_mvvm_clean/screen/counter_example.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeModeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeModeProvider.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const CounterPage(),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(color: Colors.blueAccent),
            ),
          );
        },
      ),
    );
  }
}
