import 'widget_animation_widget.dart';
import 'package:flutter/material.dart';

import 'build_animation_widget.dart';
import 'hero_animation_widget.dart';
import 'normal_animation_widget.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('动画学习'),
        ),
        body: TabBarView(
          children: [
            NormalAnimationWidget(),
            WidgetAnimation(),
            BuildAnimationPage(),
            HeroAnimation(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: const TabBar(
            tabs: [
              Icon(Icons.add,semanticLabel: 'normal动画',),
              Icon(Icons.title,),
              Icon(Icons.tiktok,),
              Icon(Icons.missed_video_call_sharp,),
            ],
            unselectedLabelColor: Colors.blue,
            labelColor: Colors.orange,


          ),
        ),
      ),
    );
  }
}
