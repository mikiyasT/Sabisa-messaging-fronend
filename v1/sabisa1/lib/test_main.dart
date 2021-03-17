
import 'package:flutter/material.dart';
import 'ItemsData.dart';

void main() => runApp(MyListApp());

class MyListApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new ListDisplay(),
    );
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
     return Scaffold(
            appBar: AppBar( title: Text('test'),),
            body: buildConversationList()
      );

    }

  Widget buildConversationList() {
    final TextEditingController eCtrl = new TextEditingController();
    return new  Column( children: <Widget>[
        new Expanded( child: new ListView.builder(
            controller:  _scrollController, 
            reverse: false,
            itemCount: items.length,
            itemBuilder: (BuildContext context , int index) {
                return Align(
                          alignment: index %2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                          child: Container(
                                  child: ListTile( title: Text(items[index]) , leading: index %2 == 0  ? CircleAvatar( child: Text('A')) : null,),
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                                  width: items[index].length > 20 ? 400 : 300,
                                  decoration: BoxDecoration(
                                  color: Colors.grey[300], borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.only(bottom: 4, right: 2),
                                ),
                          );
          }
        ) ),
        new TextField(
            
            cursorColor: Colors.red,
            maxLength: 250,
            controller: eCtrl,
            onSubmitted: (text) {
              items.add(text);
              eCtrl.clear();
              setState(() {});
              initState();
            },
          ),   
      ]
    );
}
}