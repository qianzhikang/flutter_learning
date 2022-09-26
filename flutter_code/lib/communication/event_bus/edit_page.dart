import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class EdgePage extends StatefulWidget {
  const EdgePage({Key? key}) : super(key: key);

  @override
  State<EdgePage> createState() => _EdgePageState();
}

class _EdgePageState extends State<EdgePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('修改个人信息'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child:  TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('姓名',style: TextStyle(fontSize: 20),),
                hintText: '姓名',
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(30),
            child:  TextField(
              controller: ageController,
              decoration: const InputDecoration(
                label: Text('年龄',style: TextStyle(fontSize: 20),),
                hintText: '年龄',
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
            eventBus.fire(CustomEvent(nameController.text, int.parse(ageController.text)));
          }, child: const Text('修改'))
        ],
      ),
    );
  }
}

class CustomEvent {
  String name;
  int age;

  CustomEvent(this.name, this.age);
}

EventBus eventBus = EventBus();
