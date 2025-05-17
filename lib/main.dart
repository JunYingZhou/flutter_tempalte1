import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RyanChow APP',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white, // 亮色模式背景
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[900], // 暗色模式背景
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // 跟随系统主题
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}