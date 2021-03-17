 import 'package:flutter/material.dart';
 import 'ConversationDao.dart';
 import 'dart:developer';

class DisplayChatUi extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final String toNumber = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar( title: Text('$toNumber', style: TextStyle(color: Colors.black),), backgroundColor: Colors.yellow,),
      body: Container( 
        color: Colors.black,
        child: ListDisplay()
      )
      );
    
    
    /*return new MaterialApp(
      home: new ListDisplay(),
    );*/
  }

}

class ListDisplay extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new BuildConversationList();
      
}
      
class BuildConversationList extends State<ListDisplay> {

  final ScrollController _scrollController = new ScrollController();
  
  
  void initiState() { 
    super.initState();
    _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 1000),
          );
  }

  _scrollToEnd() async {
    if (true) {
      //_needsScroll = false;
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance.addPostFrameCallback((_)=>_scrollToEnd());
     return buildConversationList();

  }

  Widget buildConversationList() {
    final TextEditingController eCtrl = new TextEditingController();
    return new  Column( 
        
        children: <Widget>[
        new Expanded( child: new ListView.builder(
            controller:  _scrollController, 
            reverse: false,
            itemCount: chats.length,
            itemBuilder: (BuildContext context , int index) {
                return Align(
                          alignment: index %2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                          child: Container(
                                  child: ListTile( title: Text(chats[index], style: TextStyle(color: Colors.white),) , leading: index %2 == 0  ? CircleAvatar( child: Text('A', style: TextStyle(color: Colors.black),), backgroundColor: Colors.yellow,) : null,),
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                                  width: chats[index].length > 20 ? 400 : 300,
                                  decoration: BoxDecoration(
                                  color: Colors.grey[900], borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.only(bottom: 4, right: 2),
                                ),
                          );
          }
        ) ),
        
            new TextField(
              maxLines: 2,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.red), 
                hintText: 'Type your message here' , 
                hintStyle: TextStyle(color: Colors.yellow),
                // suffix icon was the only way that you were able to add a send button at the right side of textfield
                suffixIcon: IconButton(icon: Icon(Icons.send, color: Colors.yellow), onPressed: () { 
                    chats.add(eCtrl.text);
                    eCtrl.clear();
                    setState(() {});
                    initState();
                }, )
                ),
              cursorColor: Colors.red,
              maxLength: 120,
              controller: eCtrl,
              onSubmitted: null,
            )
        ]
    );
}
}