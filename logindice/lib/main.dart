import 'package:flutter/material.dart';

import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/chef.gif'),
                      width: 170,
                      height: 190,
                    ),
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: InputDecorationTheme(
                                  labelStyle:
                                      TextStyle(color: Colors.teal, fontSize: 15))),
                          child: Container(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              children: [
                                TextField(
                                  controller: controller,
                                  decoration:
                                      InputDecoration(labelText: 'Enter "dice"'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextField(
                                  controller: controller2,
                                  decoration:
                                      InputDecoration(labelText: 'Enter "PW"'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                ButtonTheme(
                                    minWidth: 100,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Colors.orangeAccent)),
                                      onPressed: () {
                                        if (controller.text == "dice" &&
                                            controller2.text == "1234") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Dicepage(),
                                              ));
                                        }else if(controller.text == "dice" &&
                                            controller2.text != "1234"){
                                          showSnackBar2(context);
                                        }else if(controller.text != "dice" &&
                                            controller2.text == "1234"){
                                          showSnackBar3(context);
                                        }else{
                                          showSnackBar(context);
                                        }
                                      },
                                      child: Icon(Icons.arrow_forward,
                                          color: Colors.white, size: 35),
                                    )),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

void showSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:
      Text('로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}
void showSnackBar2(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:
      Text('비밀번호가 일치하지 않습니다',
      textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}
void showSnackBar3(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:
      Text('dice를 확인하세요',
      textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}