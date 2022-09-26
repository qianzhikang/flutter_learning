import 'package:flutter/material.dart';

import 'one_page.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sumNum = ModalRoute.of(context)!.settings.arguments as SumNum;
    return Scaffold(
      appBar: AppBar(title: Text('Result'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()=> Navigator.pop(context,sumNum.first + sumNum.second), child: Text("check result"))
            ],
          )
        ],
      ),
    );
  }
}
