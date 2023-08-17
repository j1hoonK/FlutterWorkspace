import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column / Row',
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.white,
              child: Text('1번'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 100,
              color: Colors.yellow,
              child: Text('2번'),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: Text('3번'),
            ),
            Container(
              width: double.infinity,
              height: 10,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
