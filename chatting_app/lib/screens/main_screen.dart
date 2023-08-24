import 'package:chatting_app/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            // 배경
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/red.jpg'), fit: BoxFit.fill),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 100, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Welcome',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 25,
                                  color: Colors.white),
                              children: const [
                                TextSpan(
                                  text: ' to Yummy chat!',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Signup to continue',
                          style: TextStyle(letterSpacing: 1, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )),
            // 텍스트 폼 필드
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(20),
                height: isSignupScreen ? 280 : 250,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5),
                    ]),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              if (isSignupScreen)
                                Column(
                                  children: [
                                    TextFormField(
                                      key: Key('1'),
                                      validator: (value) {
                                        if (value!.isEmpty || value.length < 4) {
                                          return 'Please enter at least 4 characters';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userName = value!;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Palette.textColor1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Palette.textColor1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: 'User name',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      key: Key('2'),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !value.contains('@')) {
                                          return 'Please enter a valid email address.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userEmail = value!;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Palette.textColor1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Palette.textColor1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: 'Email adress',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty || value.length < 6) {
                                          return 'Password must be at least 7 characters long.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userPassword = value!;
                                      },
                                      key: Key('3'),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.key,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Palette.textColor1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Palette.textColor1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          key: Key('4'),
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !value.contains('@')) {
                                              return 'Please enter a valid email address.';
                                            }
                                            return null;
                                          },
                                          onSaved: (value){
                                            userEmail = value!;
                                          },
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Palette.iconColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Palette.textColor1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(35),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Palette.textColor1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(35),
                                              ),
                                            ),
                                            hintText: 'Email adress',
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Palette.textColor1,
                                            ),
                                            contentPadding: EdgeInsets.all(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          key: Key('5'),
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                value.length < 6) {
                                              return 'Password must be at least 7 characters long.';
                                            }
                                            return null;
                                          },
                                          onSaved: (value){
                                            userPassword = value!;
                                          },
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.key,
                                              color: Palette.iconColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Palette.textColor1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(35),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Palette.textColor1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(35),
                                              ),
                                            ),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Palette.textColor1,
                                            ),
                                            contentPadding: EdgeInsets.all(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // 전송버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: isSignupScreen ? 420 : 390,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: GestureDetector(
                    onTap: (){
                      _tryValidation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.red],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1.2, 1.2)),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // SSO
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: isSignupScreen ? MediaQuery.of(context).size.height - 125
              : MediaQuery.of(context).size.height - 165,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or SignUp with' : 'or Signin with'),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                      style: TextButton.styleFrom(
                        iconColor: Colors.white,
                        backgroundColor: Palette.googleColor,
                        minimumSize: Size(155, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text(
                        'Google',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
