import 'package:valoflute/views/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valoflute',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent)
              .copyWith(background: Colors.black),
          textTheme: Typography.whiteCupertino,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      home: const Homescreen(title: 'Valoflute'),
      debugShowCheckedModeBanner: false,
    );
  }
}
