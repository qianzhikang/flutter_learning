import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("自定义按钮")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 20,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.black87,
              onPressed: () => print('FloatingActionButton pressed'),
              child: const Text('FAB'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange, //按钮背景色
                primary: Colors.white, //文字颜色
              ),
              onPressed: () => print('TextButton pressed'),
              child: const Text('TextButton'),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo, //按钮背景色
                primary: Colors.yellow, //文字颜色
              ),
              onPressed: () => print('ElevatedButton pressed'),
              child: const Text('ElevatedButton'),
            ),
          ],
        ),
      ),
    );
  }
}
