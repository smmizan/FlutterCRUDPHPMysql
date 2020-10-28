import 'package:flutter/material.dart';
import 'package:flutter_crud_php_mysql/model/model.dart';
import 'package:flutter_crud_php_mysql/pages/add_item.dart';
import 'package:flutter_crud_php_mysql/services/my_services.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}




class _HomePagesState extends State<HomePages> {

  List<Model> list;
  bool isLoading = true;

  getAllData() async{
    list = await MyServices().getData();
    setState(() {
      isLoading = false;
    });

    print('Data : ${list.length}');
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pages'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddInsertData())).then((value) => getAllData());
          })
        ],
      ),

      body: isLoading ? Center(child: CircularProgressIndicator(),) : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
          Model model = list[index];
          return ListTile(
            onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddInsertData(model: model,index: index,))).then((value) => getAllData());
            },
            leading: CircleAvatar(child: Text(model.name[0]),),
            title: Text(model.name),
            subtitle: Text(model.mail),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){

                }),
          );

        },

      )
    );
  }
}
