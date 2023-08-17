import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScreenA',
      theme: ThemeData(primaryColor: Colors.blue),
      home: ScreenA(),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext contextt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go ScreenB'),
              onPressed: () {
                Navigator.pushNamed(contextt, '/b');
              },
            ),ElevatedButton(
              child: Text('Go ScreenC'),
              onPressed: () {
                Navigator.pushNamed(contextt, '/c');
              },
            ),
          ],
        ),
      ),
    );
  }
}