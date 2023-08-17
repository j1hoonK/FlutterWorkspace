import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScreenB',
      theme: ThemeData(primaryColor: Colors.blue),
      home: ScreenB(),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext contextt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go First Page'),
              onPressed: () {
              },
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(contextt);
                },
                child: Text('Go First Page'))
          ],
        ),
      ),
    );
  }
}