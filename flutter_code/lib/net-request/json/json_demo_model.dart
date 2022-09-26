class Student{
  String? id;
  String? name;
  int? score;
  List<Teacher>? teachers;

  Student(this.id, this.name, this.score, this.teachers);
  factory Student.fromJson(Map<String,dynamic> map){
    List<Teacher> newList = [];
    for(var item in map['teachers']){
      newList.add(Teacher(item['name'], item['age']));
    }
    return Student(map['id'], map['name'], map['score'],newList);
  }
}

class Teacher{
  String? name;
  int? age;
  Teacher(this.name, this.age);
}