import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_to_do/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      title: 'Task To Do',
      home: const HomePage(),
    );
  }
}
