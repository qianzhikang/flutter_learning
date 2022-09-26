import 'package:flutter/material.dart';

import '../global/style.dart';
import '../model/type_model.dart';


class AppTypeListItem extends StatelessWidget {
  // const AppTypeListItem({Key? key}) : super(key: key);

  TypeModel typeModel;

  AppTypeListItem(this.typeModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      width: 80,
      height: 80,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            typeModel.iconData,
            color: mainColor,
          ),
          Text(
            typeModel.tag,
            style: const TextStyle(
              fontSize: 13,
              color: mainColor,
            ),
            // style: ,
          )
        ],
      ),
    );
  }
}
