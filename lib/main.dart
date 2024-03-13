import 'package:demo2/homepage.dart';
import 'package:demo2/todo.dart';
import 'package:demo2/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        //"/page1": (context) => const TodosScreen(),
        "/page2": (context) => const Page2(),
      },
    );
  }
}
