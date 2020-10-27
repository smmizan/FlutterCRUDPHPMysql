import 'package:flutter/material.dart';

class AddInsertData extends StatefulWidget {
  @override
  _AddInsertDataState createState() => _AddInsertDataState();
}

class _AddInsertDataState extends State<AddInsertData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'name'),
              controller: ,
            ),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(hintText: 'mail'),
              controller: ,
            ),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(hintText: 'address'),
              controller: ,
            ),
            SizedBox(height: 8,),
            RaisedButton(
              child: Text('Insert Data'),
              onPressed: (){

              },
            )


          ],
        ),
      ),
    );
  }
}
