import 'package:flutter/material.dart';
import 'package:sabisa1/ConversationList.dart';



class EditMessage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  final String recipientNumber = ModalRoute.of(context).settings.arguments;
 return Scaffold(
      backgroundColor: Colors.black38,
      //appBar: AppBar(title: Text('conversation with $recipientNumber', style: TextStyle(color: Colors.white),), backgroundColor: Colors.black38,),
      body: Column( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                    //getConversationList(),
                    new Expanded( child : getCustomConversationList()),  //with out new Expanded , adding a scrollable list in a column(which is scrollable itself) would break
                    SendMessage(),
              ],
            ),
      );
  }

}


class SendMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
            //height: 50,
            decoration: BoxDecoration(
            color: Colors.black38,
        
            border: Border.all(),
            ),
            alignment: Alignment.bottomCenter,
            child: Row(

              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: EditMessageTextBox(),
                ),
                Container(child: GestureDetector(child: Icon(Icons.send, color: Colors.yellow,), onTap: null,))
              ],
            ),
          );
  }
}


class EditMessageTextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      //height: 50,
      decoration: BoxDecoration(
        color: Colors.black38,
        border: Border.all(),
      ),
      child: Center( child: SizedBox(width: MediaQuery.of(context).size.width*0.5,
                        child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  
                                  decoration: InputDecoration(
                                                fillColor: Colors.grey[850],
                                                filled: true,
                                                hintText: 'Enter Message',
                                                
                                                hintStyle: TextStyle(color: Colors.white),
                                                
                                                
                                              )
                                  
                                )
              ))
    );
  }
}
