import 'package:flutter/material.dart';

import 'my_button/my_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(primaryColor: Colors.white),
      home: LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                minimumSize: Size.fromHeight(60),
                textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120,),
            Image.asset('assets/images/logo.png',width: 200,),
            SizedBox(height: 170),
            MyButton(
              image: Image.asset('assets/images/glogo.png'),
              text: Text('Login with Goggle',
                  style: TextStyle(color: Colors.black)), color: Color(0xffececef), onPressed: () {  },
            ),
            SizedBox(height: 10,),
            MyButton(
                color: Color(0xff00bf18),
                image: Image.asset('assets/images/naver.png', width: 35,),
                onPressed: (){},
                text: Text('Login with Naver',
                    style: TextStyle(color: Colors.white))
            ),
            SizedBox(height: 10,),
            MyButton(
                color: Color(0xfff8d000),
                image: Image.asset('assets/images/kakao.png', width: 30),
                onPressed: (){ },
                text: Text('Login with kakao',
                    style: TextStyle(color: Colors.black))
            ),
          ],
        ),
      ),
    );
  }
}
