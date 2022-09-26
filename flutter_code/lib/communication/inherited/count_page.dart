import 'package:flutter/material.dart';
import 'package:flutter_code/communication/inherited/text_widget.dart';

import 'inherited_container.dart';

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => CountPageState();
}


class CountPageState extends State<CountPage> {
  int count = 10;
  void _add(){
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget'),
        ),
        body: InheritedContainer(this,_add,child:  TextWidget(),),
    );
  }
}
