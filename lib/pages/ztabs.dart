import 'package:flutter/material.dart';

class ZTabs extends StatefulWidget {

  const ZTabs({super.key});

  @override
  State<ZTabs> createState() => _TabState();
}

class _TabState extends State<ZTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/hero', arguments: 'Hero');
            },
            child: const Text('Go to Home'),
          ),
      ),
    );
  }
}

