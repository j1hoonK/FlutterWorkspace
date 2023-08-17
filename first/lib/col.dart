import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ddd',
      home: MyPage(),
    );
  }
}


class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast message'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            flutterToast();
          },
          child: Text('Toast'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
        ),
      ),

    );

  }
}

void flutterToast() {
  Fluttertoast.showToast(msg: 'Flutter',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.redAccent,
      toastLength: Toast.LENGTH_SHORT
  );
}