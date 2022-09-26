import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/style.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar04.jpeg'),
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left:16),
            child: Column(
              children: const [
                Text(
                  'hello, qzk',
                  style: titleStyle,
                ),
                Text(
                  'app developer',
                  style: summaryStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
