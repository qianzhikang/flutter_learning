import 'dart:math';
import 'package:work/page1.dart';
import 'package:work/parent.dart';
import 'package:work/placeholder-demo.dart';

import 'button.dart';
import 'count-demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        // appBar: AppBar(title: Text("img change")),
        // body: const MyHomePage(title: "title"),
        // body: const Page1(),
        body: const ButtonDemo(),
        // body: const HomeContent(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List picList = [
    "https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar01.jpg",
    "https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar02.jpg",
    "https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar06.jpg"
  ];
  String picStr =
      "https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar01.jpg";

  void changeImg() {
    setState(() {
      picStr = picList[Random().nextInt(picList.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 400,
            height: 400,
            child: FloatingActionButton(
              onPressed: changeImg,
              child: Container(
                child: Image.network(
                  picStr,
                  fit: BoxFit.fitHeight,
                ),
              ),
              backgroundColor: Colors.transparent,
            )));
  }
}

