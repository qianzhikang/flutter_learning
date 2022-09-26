import 'package:flutter/material.dart';

import 'hero_animation_page2.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HeroAnimationPage2(),
            ),
          );
        },
        child: Row(
          children: const [
            Hero(
                tag: 'hero',
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: FlutterLogo(),
                )),
            Text('点击logo'),
          ],
        ),
      ),
    );
  }
}
