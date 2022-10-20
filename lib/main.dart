import 'package:flutter/material.dart';
import 'package:potacoin/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PotaCoin',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}
