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
      debugShowCheckedModeBanner: false, // 隐藏调试模式横幅
      title: 'RyanChow APP', // 应用程序标题
      theme: ThemeData(
        primarySwatch: Colors.amber, // 主题主色调为琥珀色
        scaffoldBackgroundColor: Colors.white, // 亮色模式背景
        useMaterial3: true, // 使用Material 3设计规范
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.amber, // 暗色模式主题主色调仍为琥珀色
        scaffoldBackgroundColor: Colors.grey[900], // 暗色模式背景
        useMaterial3: true, // 暗色模式下也使用Material 3设计规范
      ),
      themeMode: ThemeMode.system, // 跟随系统主题设置
      initialRoute: '/', // 初始路由为根路由
      onGenerateRoute: onGenerateRoute, // 路由生成回调函数
    );
  }
}