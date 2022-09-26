import 'package:flutter/material.dart';

class HeroAnimationPage2 extends StatelessWidget {
  const HeroAnimationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hero 动画'),
      ),
      body: const Center(
        child: Hero(
          tag: 'hero',
          child: SizedBox(
            width: 200,
            height: 200,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
