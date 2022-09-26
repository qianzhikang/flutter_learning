import 'package:flutter/material.dart';
import 'inherited_container.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    InheritedContainer state = InheritedContainer.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('${state.model.count}',style: const TextStyle(fontSize: 25),)
          ),
          FloatingActionButton(onPressed: state.add,child: const Icon(Icons.add),)
        ],
      ),
    );
  }
}
