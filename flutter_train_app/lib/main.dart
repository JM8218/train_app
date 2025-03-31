import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Train App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(), // 바로 HomePage 띄우기
    );
  }
}
