import 'package:flutter/material.dart';
import 'package:sabisa1/MessageList.dart';
import 'package:sabisa1/ContactsList.dart';
import 'package:sabisa1/AccountInfo.dart';

class SabisaHomePage extends StatefulWidget {
  SabisaHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SabisaHomePage> {
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  void _startEditor(){
      Navigator.pushNamed(context,'/newMessage');
  }

 static  List<Widget> _widgetOptions = <Widget>[
   MessageList(),
   getContactList(),
   AccountInfo(),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sabisa' , style: TextStyle(color: Colors.black),), backgroundColor: Colors.yellow,),
      body: Container( decoration: BoxDecoration( color: Colors.black), child : _widgetOptions.elementAt(_selectedIndex)),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: _startEditor,
          tooltip: 'Edit',
          child: Icon(Icons.edit,color: Colors.black),
          
        ),
        bottomNavigationBar: _buildBottomNavigation(), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
    _buildBottomNavigation(){
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat, color: _selectedIndex == 0 ? Colors.yellow : Colors.white) , title: Text('Conversations', style: _selectedIndex == 0 ? TextStyle(color: Colors.yellow): TextStyle(color: Colors.white),)),
          BottomNavigationBarItem(icon: Icon(Icons.contacts, color: _selectedIndex == 1 ? Colors.yellow : Colors.white) , title: Text('Contacts', style: _selectedIndex == 1 ? TextStyle(color: Colors.yellow) : TextStyle(color: Colors.white))),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: _selectedIndex == 2 ? Colors.yellow : Colors.white) , title: Text('Account', style: _selectedIndex == 2 ? TextStyle(color: Colors.yellow) : TextStyle(color: Colors.white))),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        
        );
    }
}
