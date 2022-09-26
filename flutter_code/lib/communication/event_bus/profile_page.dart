import 'dart:async';

import 'package:flutter/material.dart';

import 'edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String name = 'qzk';
  int age = 20;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        name = event.name;
        age = event.age;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人信息'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Title(
                  color: Colors.grey.shade700,
                  child: Text('姓名:',
                      style:
                          TextStyle(fontSize: 25, color: Colors.grey.shade700)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Title(
                  color: Colors.grey.shade700,
                  child: Text('年龄:',
                      style:
                          TextStyle(fontSize: 25, color: Colors.grey.shade700)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  age.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EdgePage()));
                },
                child: const Text('去修改'))
          ],
        ),
      ),
    );
  }
}
