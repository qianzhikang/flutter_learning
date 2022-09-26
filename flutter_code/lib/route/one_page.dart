import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  SumNum sumNum = SumNum(1, 1);
  String result = '?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Number Sum'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${sumNum.first} + ${sumNum.second} = $result',style: TextStyle(fontSize: 30),),
              // const SizedBox(height: 30,),
              ElevatedButton(onPressed: ()=>{
                Navigator.pushNamed(context, 'two_page',arguments: sumNum).then((value){
                  setState(() {
                    result = value.toString();
                  });
                })
              }, child: const Text('Get Result'))
            ],
          ),
        ],
      ),
    );
  }
}

class SumNum{
  int first;
  int second;
  SumNum(this.first,this.second);
}