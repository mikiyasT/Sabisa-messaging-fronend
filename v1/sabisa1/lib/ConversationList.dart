import 'package:flutter/material.dart';


  
Widget getCustomConversationList() {
  String msg1 = 'message was and this was \nllllloong ya it \n was supposed to be this big but not';
  String msg2 = 'alright alright';
    return 
    CustomScrollView(
        
        slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.black38,
              pinned: true,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(centerTitle: true, title: Text('Conversation'),),
            ),
            SliverFixedExtentList(
              itemExtent: 50,
            
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                  return Container(
                    constraints: BoxConstraints(
                                  maxHeight: double.infinity,
                                 ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    //height: 10000,
                    //width: double.maxFinite,
                    child: Container( 
                      
                       height: 180,
                      //width: 10,
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      margin: EdgeInsets.all(5),
                      alignment: index %2 == 0 ? Alignment.topLeft : Alignment.topRight,
                      child: Card( 
                            
                            color: index %2 == 0 ?  Colors.grey[900] : Colors.yellow,
                            elevation: 15, 
                            child: Text(
                               index %2 == 0 ? msg1 + '$index' : msg2 + '$index',
                               style: TextStyle( color: index %2 == 0 ?  Colors.white : Colors.black, fontSize: 20),
                               softWrap: true,
                               )
                            )
                      )
                    
                  );
              }),
            ),
            

        ],
      );
  }
   
