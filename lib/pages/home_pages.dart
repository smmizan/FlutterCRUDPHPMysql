import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_crud_php_mysql/pages/add_item.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pages'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddInsertData()));
          })
        ],
      ),

      body: Container(

      ),
    );
  }
}
