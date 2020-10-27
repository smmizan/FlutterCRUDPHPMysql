import 'package:flutter_crud_php_mysql/model/model.dart';
import 'package:http/http.dart' as Http;

class MyServices{

  static const URL_INSERT = "";

  Future<String> addData(Model model) async{
    final response = await Http.post(URL_INSERT,body: model.toJsonAdd());
    if(response.statusCode == 200){
      print('Response is : ${response.body}');
      return response.body;

    }else{
      print('Failed to Insert Data.');
    }

  }

}