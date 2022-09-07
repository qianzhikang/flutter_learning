import 'package:flutter/material.dart';

class MyCount extends StatelessWidget {
  const MyCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("count"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            MyTextWidget()
          ],
        ),
      ),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  const MyTextWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyTextWidgetState();
}

class MyTextWidgetState extends State<MyTextWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
