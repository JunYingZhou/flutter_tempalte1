import 'package:flutter/material.dart';

class ZHeroPage extends StatefulWidget {

  // final String arguments1;
  final Map arguments;
  const ZHeroPage({super.key, required this.arguments});

  @override
  State<ZHeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<ZHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.arguments["imageUrl"]),
            Text(widget.arguments.values.toString()),            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: Text("Go Home"),
            ),
          ],
        ),
      ),
    );
  }
}

