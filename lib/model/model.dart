
class Model{
  String id;
  String name;
  String mail;
  String address;

  Model({
    this.id,
    this.name,
    this.mail,
    this.address
  });


  factory Model.fromJson(Map<String,dynamic> json){
    return Model(
      id: json['id'],
      name: json['name'],
      mail: json['mail'],
      address: json['address'],
    );

  }



  Map<String,dynamic> toJsonAdd() {
    return{
      "name":name,
      "mail":mail,
      "address":address,
    };
}



  Map<String,dynamic> toJsonUpdate() {
    return {
      "id": id,
      "name": name,
      "mail": mail,
      "address": address,
    };
  }






}