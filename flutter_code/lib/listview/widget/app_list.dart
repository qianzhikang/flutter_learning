import 'package:flutter/cupertino.dart';


import '../mock/data.dart';
import '../model/list_model.dart';
import 'app_list_item.dart';

class AppList extends StatelessWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          ListModel model = items[index];
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListItem(model.title, model.subTitle, model.bgImg),
          );
        },
      ),
    );
  }
}
