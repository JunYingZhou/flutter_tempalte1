// 系统设置dart
import 'package:flutter/material.dart';

class SystemSetting extends StatefulWidget {
  const SystemSetting({super.key});

  @override
  State<SystemSetting> createState() => SystemSettingState();
}
class SystemSettingState extends State<SystemSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('系统设置'),
      ),
      body: const Center(
        child: Text('系统设置页面'),
      ),
    );
  } 
}