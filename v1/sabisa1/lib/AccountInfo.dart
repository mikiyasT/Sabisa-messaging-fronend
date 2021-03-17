import 'package:flutter/material.dart';


class AccountInfo extends StatelessWidget {
  List<String> headers = ['Your Info','Points','How to'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(centerTitle: true, title: Text('Account', style: TextStyle(color: Colors.white , fontSize: 30),), backgroundColor: Colors.black38),
      body: new ListView.builder(
        itemCount: headers.length,

        itemBuilder: (context, i) {
          return new ExpansionTile(
            backgroundColor: Colors.grey[850],
            trailing: Icon(Icons.expand_more, color: Colors.white,),
            leading: Icon(Icons.dehaze, color: Colors.white,),
            title: new Text(
              headers[i],
              style: new TextStyle(
                  fontSize: 20.0,
                  
                  color: Colors.white),
            ),
            children: <Widget>[
              _buildExpandableContent(headers[i])
            ],
          );
        },
      ),
    );
    
  }

  _buildExpandableContent(String title) {
    //List<Widget> infoColumns;
    switch(title){
      case 'Your Info': {
          return Container(
            child: Text('Your name is ', style: TextStyle(color: Colors.white),),
          );
      }
      break;
      case 'Points' : {
          return Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
               
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black,
                ), 
                
                child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text('Remaining Balance : 200 Points',style: TextStyle(color: Colors.white)),
                  Text('_________________________________________',style: TextStyle(color: Colors.white,)),
                  Text('10 Point = 10 Message = \$0.1 Cents',style: TextStyle(color: Colors.white , fontSize: 12 , fontStyle: FontStyle.italic)),
              ])),  
              
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border.all(),
                  color: Colors.black,
                ),
                
                child: GestureDetector( child: Row(children: [ Text('Add ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),), Icon(Icons.monetization_on, color: Colors.yellow,)]), onTap: null,))
            ],),
          );
      } 
      break;
      case 'How to': {
            return Container(
            child: Text('How to use ',style: TextStyle(color: Colors.white)),
          );
      }
      break;

    }
  }
} 

