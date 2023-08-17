import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snack Bar',
      home: SnBar(),
    );
  }
}

class SnBar extends StatelessWidget {
  const SnBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red[300],
      appBar: AppBar(
        title: Text('Snack Bar'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
        elevation: 0,
      ),
      body: Builder(builder: (BuildContext ctx) {
        return Center(
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                content: Text('해ㅡㅡ위'),
              ));
            },
            child: Text(
              'Show me',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },),
    );
  }
}
