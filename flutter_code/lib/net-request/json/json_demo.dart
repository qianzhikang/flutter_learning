import 'dart:convert';

import 'json_demo_model.dart';


void main(){
  String jsonString = '''
  {
    "id":"123",
    "name":"qzk",
    "score":95,
    "teachers":[
      {
        "name":"lisi",
        "age":45
      },
      {
        "name":"zhangsan",
        "age":45
      }
    ]
  }
  ''';
  var jsonRes = json.decode(jsonString);
  print(jsonRes['teachers']);
  Student student = Student.fromJson(jsonRes);
  // print(student.teachers);
  student.teachers?.forEach((element) {print(element.name);});
}

