import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String msg = 'null';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page One'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, 'page_two'), child: Text('Go to page2')),
              ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, 'hello'), child: Text('Go to unknown page'))
            ],
          ),
        ],
      ),
    );
  }
}
