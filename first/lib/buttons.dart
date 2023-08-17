import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buttons',
      home: MyButtons(),
    );
  }
}

class MyButtons extends StatelessWidget {
  const MyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                debugPrint('Text button');
              },
              onLongPress: (){
                debugPrint('Long press');
              },
              style: TextButton.styleFrom(
                // backgroundColor: Colors.orangeAccent,
              ),
              child: Text(
                'Text button',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
                onPressed: (){debugPrint('ElevatedButton');},
                child: Text("ElevatedButton"),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),

                ),

            )],
        ),
      ),
    );
  }
}
