import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/style.dart';
import '../page/detail_page.dart';

class ListItem extends StatelessWidget {
  String title;
  String bgImg;
  String subTitle;

  ListItem(this.title, this.subTitle, this.bgImg, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const CoverDetail()));
      },
      child: Container(
        width: 180,
        height: 250,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(bgImg),
              fit: BoxFit.cover,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: lightTitleStyle,
            ),
            Text(
              subTitle,
              style: lightSubTitleStyle,
            )
          ],
        ),
      ),
    );
  }
}
