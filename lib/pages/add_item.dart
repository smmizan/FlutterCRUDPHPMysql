import 'package:flutter/material.dart';
import 'package:flutter_crud_php_mysql/model/model.dart';
import 'package:flutter_crud_php_mysql/services/my_services.dart';
import 'package:toast/toast.dart';

class AddInsertData extends StatefulWidget {
  final Model model;
  final int index;

  AddInsertData({this.model,this.index});


  @override
  _AddInsertDataState createState() => _AddInsertDataState();
}

class _AddInsertDataState extends State<AddInsertData> {

  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController address = TextEditingController();

  bool updateData = false;


  _saveData(Model model) async{
    await MyServices().addData(model).then((value){
      Toast.show("Successfully Inserted Data", context,gravity:Toast.CENTER,duration: 2);
      Navigator.pop(context);
    });
  }



  _updateData(Model model) async{
    await MyServices().updateData(model).then((value){
      Toast.show("Updated Data", context,gravity:Toast.CENTER,duration: 2);
      Navigator.pop(context);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.index != null){
      updateData = true;
      name.text = widget.model.name;
      mail.text = widget.model.mail;
      address.text = widget.model.address;

    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(updateData ? 'Update Data' : 'Add Data'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(hintText: 'name'),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: mail,
                decoration: InputDecoration(hintText: 'mail'),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: address,
                decoration: InputDecoration(hintText: 'address'),
              ),
              SizedBox(height: 8,),
              RaisedButton(
                child: Text(updateData ? 'Update Data' : 'Insert Data'),
                onPressed: (){
                  if(updateData){
                    Model model = Model(id:widget.model.id,name: name.text,mail: mail.text,address: address.text);
                    _updateData(model);

                  }else{
                    if(name.text.isEmpty && mail.text.isEmpty && address.text.isEmpty){
                      Toast.show("Please fillup this filed", context,gravity: Toast.CENTER,duration: 2);
                    }else{
                      Model model = Model(name: name.text,mail: mail.text,address: address.text);
                      _saveData(model);
                    }
                  }

                },
              )


            ],
          ),
        ),
      ),
    );
  }
}
