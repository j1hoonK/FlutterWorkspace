import 'package:first/navigator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            debugPrint('Menu Button is clicked');
          },
        ),*/
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Cart Button is Clicked');
            },
            icon: Icon(Icons.add_shopping_cart),
          ),
          IconButton(
              onPressed: () {
                debugPrint('Search Button is Clicked');
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/2.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/peso.jpg'),
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/images/1.jpg'),
                // ),
              ],
              accountName: Text('AAA'),
              accountEmail: Text('AAA@naver.com'),
              onDetailsPressed: () => debugPrint('Button is clicked'),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[850]),
              title: Text('home'),
              onTap: () => debugPrint('HomeButton is clicked'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[850]),
              title: Text('settings'),
              onTap: () => debugPrint('settings is clicked'),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[850]),
              title: Text('Q&A'),
              onTap: () => debugPrint('Q&A is clicked'),
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Nav(),));
          }, child: Text('Nav'))],
        ),
      ),
    );
  }
}
