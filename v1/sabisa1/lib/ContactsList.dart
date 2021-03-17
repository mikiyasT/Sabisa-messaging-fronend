import 'package:flutter/material.dart';
import 'ContactsDao.dart';
import 'dart:developer';
//import 'ContactsDao.dart';


 
Widget getContactList() {
  List names = Contacts().allContacts;
  int size = names.length;
  log('names size $names.length');
    return CustomScrollView(
        slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.black38,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(centerTitle: true, title: Text('Contacts'),),
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                 index = index % size;
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    height: 1000,
                    width: double.maxFinite,
                    child: GestureDetector( onTap: () => Navigator.pushNamed(context,'/newMessage',arguments: names[index]), 
                                            child : Card( color: Colors.grey[900],elevation: 5, child: Text(names[index], style: TextStyle( color: Colors.white),)),)
                    
                  );
              }),
            )
        ],
      );
  }
   
