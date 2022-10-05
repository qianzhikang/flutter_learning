import 'package:flutter/material.dart';

import '../theme/config.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),backgroundColor: Config.primaryColor,),
      body: Text("New"),);
  }
}
