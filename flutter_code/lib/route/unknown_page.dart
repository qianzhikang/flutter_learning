import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Page'),),
      body: const Center(
        child: Text('unknown page',style: TextStyle(fontSize: 30,color: Colors.red),),
      ),
    );
  }
}
