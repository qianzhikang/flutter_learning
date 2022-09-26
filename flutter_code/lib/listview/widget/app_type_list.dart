import 'package:flutter/material.dart';


import '../global/style.dart';
import '../model/type_model.dart';
import 'app_type_list_item.dart';

class AppTypeList extends StatelessWidget {
  const AppTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TypeModel> items = [
      TypeModel(Icons.home, "type1"),
      TypeModel(Icons.access_alarm,"type2"),
      TypeModel(Icons.abc_outlined,"type3"),
      TypeModel(Icons.add_circle,"type4"),
      TypeModel(Icons.vaccines,"type5"),
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Type",
                style: titleStyle,
              ),
              Text(
                "See more",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15,
                ),
              )
            ],
          ),

          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppTypeListItem(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
