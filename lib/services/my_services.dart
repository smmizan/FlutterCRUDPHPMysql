import 'dart:convert';

import 'package:flutter_crud_php_mysql/model/model.dart';
import 'package:http/http.dart' as Http;

class MyServices{

  static const URL_INSERT = "https://smmizan.com/appWorld/flutter/crud/insertData.php";
  static const URL_GET = "https://smmizan.com/appWorld/flutter/crud/getData.php";

  Future<String> addData(Model model) async{
    final response = await Http.post(URL_INSERT,body: model.toJsonAdd());
    if(response.statusCode == 200){
      print('Response is : ${response.body}');
      return response.body;

    }else{
      print('Failed to Insert Data.');
    }

  }


  List<Model> dataFromJson(String jsonString){
    final data = json.decode(jsonString);
    return List<Model>.from(data.map((item) => Model.fromJson(item)));
  }



  Future<List<Model>> getData() async{
    final response = await Http.get(URL_GET);
    if(response.statusCode == 200){
      List<Model> list = dataFromJson(response.body);
      return list;
    }else{
      return List<Model>();
    }

  }




}