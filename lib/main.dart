import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RyanChow APP',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
        initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
    throw UnimplementedError();
  }


}