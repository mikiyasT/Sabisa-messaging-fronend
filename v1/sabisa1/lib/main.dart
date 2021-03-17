import 'package:flutter/material.dart';
import 'package:sabisa1/AccountInfo.dart';
import 'package:sabisa1/ChatScreen.dart';
//import 'package:sabisa1/WriteMessageScreen.dart';
import 'package:sabisa1/SabisaHome.dart';
import 'package:sabisa1/EditMessage.dart';
import 'package:sabisa1/DisplayChatUi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => SabisaHomePage(title: 'Sabisa1'),
        '/newMessage': (context) => EditMessage(),
        '/newMessage': (context) => DisplayChatUi(),
        '/chatScreen': (context) => ChatScreen(),
        '/accountInfo': (context) => AccountInfo()
      },
      title: 'Sabisa_one',
      
    );
  }
}

