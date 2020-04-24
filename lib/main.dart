import 'package:flutter/material.dart';

import 'NavBar.dart';
import 'NavBarItem.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(
        screen: <Widget>[
          Container(color: Colors.orange,),
          Container(color: Colors.purple,),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
        ],
        item: [
          NavBarItem(
            color: Colors.orange,
            text: 'Home',
            icon: Icons.home,
          ),
          NavBarItem(
            color: Colors.purple,
            text: 'Logger',
            icon: Icons.access_time,
          ),
          NavBarItem(
            color: Colors.blue,
            text: 'Documents',
            icon: Icons.folder_open,
          ),
          NavBarItem(
            color: Colors.red,
            text: 'Search',
            icon: Icons.search,
          ),
        ],
      ),
    );
  }
}