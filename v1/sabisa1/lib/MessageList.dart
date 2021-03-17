import 'package:flutter/material.dart';
import 'package:sabisa1/ChatScreen.dart';

class MessageList extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        
        slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.black38,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(centerTitle: true, title: Text('Messages'),),
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    height: 100,
                    width: double.maxFinite,
                    child: GestureDetector( onTap: () => Navigator.pushNamed(context,'/newMessage', arguments: 'recipient $index'), 
                                            child : Card( color: Colors.grey[900],elevation: 5, child: Text('List item $index', style: TextStyle( color: Colors.white),)),)
                    
                  );
              }),
            )
        ],
      );
    }
    }

