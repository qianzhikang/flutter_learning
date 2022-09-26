import 'package:flutter/material.dart';

class BuildAnimationPage extends StatefulWidget {
  const BuildAnimationPage({Key? key}) : super(key: key);

  @override
  State<BuildAnimationPage> createState() => _BuildAnimationPageState();
}

class _BuildAnimationPageState extends State<BuildAnimationPage> with SingleTickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    //  非线性动画
    final CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    animation = Tween(begin: 50.0, end: 200.0).animate(curve);

    //  启动动画
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder:(context,child)=>SizedBox(
          width: animation.value,
          height: animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
