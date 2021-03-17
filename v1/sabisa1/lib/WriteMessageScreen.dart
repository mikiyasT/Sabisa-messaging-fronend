import 'package:flutter/material.dart';

class WriteMessageScreen extends StatelessWidget{

  void _sendMessage(){

  }

  void _addContact(){

  }
  @override
  Widget build(BuildContext context) {
    bool showButtons = false;

    return Scaffold(
      backgroundColor: Colors.black38,
      
      appBar: AppBar(title: Text('new conversation', style: TextStyle(color: Colors.white),), backgroundColor: Colors.black38,),
      body: Center(
        child: Container(
        height: MediaQuery.of(context).size.height,  
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[ 
            Row( children: [

              SizedBox(width: MediaQuery.of(context).size.width*0.9,
                        child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  
                                  cursorColor: Colors.white,
                                  
                                  decoration: InputDecoration(
                                                fillColor: Colors.grey[850],
                                                filled: true,
                                                
                                                labelText: 'Recipient number',
                                              )
                                  
                                )
              ),
              
              GestureDetector(child: Container( color: Colors.yellow,child: Icon(Icons.add_circle)), onTap: _addContact, )
              
              ]),
              Container( ),
              Container( ),
              Container( ),
            Row( children: [ 
              SizedBox( width: MediaQuery.of(context).size.width*0.9,
                        child: TextFormField(
                                  decoration: InputDecoration(
                                                  labelText: 'Enter Message',
                                                  counterText: '128 chars',
                                                  fillColor: Colors.grey[850],
                                                  filled: true,
                                              )
                                ),
                      ),
              
                    GestureDetector(child: Container( color: Colors.yellow,child: Icon(Icons.send)), onTap: _sendMessage, )
              ])
        ],
        ),
        )
      ),
      
      
    );
  }
}