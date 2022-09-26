import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _msg = 'Page2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Two'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_msg,style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'page_three',
                      arguments: 'hello page3').then((value){
                        setState(() {
                          _msg = value as String;
                        });
                  }),
                  child: Text('Go to Page3'))
            ],
          ),
        ],
      ),
    );
  }
}
