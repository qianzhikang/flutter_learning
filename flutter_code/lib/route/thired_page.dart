import 'package:flutter/material.dart';

class ThiredPage extends StatelessWidget {
  const ThiredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Page Three'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is Page3',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              Text('page2\'s msg: $msg',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: ()=>Navigator.pop(context,'hello page2'), child: Text('Back')),
            ],
          ),
        ],
      ),
    );
  }
}
