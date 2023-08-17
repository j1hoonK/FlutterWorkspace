import 'package:first/ScreenA.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScreenC',
      theme: ThemeData(primaryColor: Colors.blue),
      home: ScreenC(),
    );
  }
}

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext contextt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go First Page'),
              onPressed: () {
                Navigator.push(contextt,
                    MaterialPageRoute(builder: (_) => ScreenA()));
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