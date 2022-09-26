import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  // final SETTING_TIME = Duration.secondsPerMinute * 1;
  final SETTING_TIME = 10;
  late int countDown;
  Timer timer = Timer(const Duration(seconds: 1), () {});
  late int pastTime;
  bool isPause = false;
  Color textColor = Colors.red;

  @override
  void initState() {
    countDown = SETTING_TIME;
    pastTime = countDown;
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    // 开始倒计时
    void startCountdown() {
      if (timer.isActive) {
        timer.cancel();
        setState(() {
          textColor = Colors.red;
          isPause = false;
        });
      } else {
        setState(() {
          textColor = Colors.green;
          isPause = true;
        });
        if (pastTime != SETTING_TIME) {
          countDown = pastTime;
        }
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            countDown--;
          });
          if (countDown == 0) {
            timer.cancel();
            showDialog(
                context: context,
                builder: (context) {
                  return  AlertDialog(
                    title: const Center(child: Text("🎉 恭喜 🎉",style: TextStyle(fontSize: 30,fontFamily: "WawaSc"),)),
                    content: const Text("你完成了本次专注训练！",style: TextStyle(fontSize: 22,fontFamily: "WawaSc"),textAlign: TextAlign.center,),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('确定',style: TextStyle(fontSize: 20,fontFamily: "WawaSc"),),
                      ),
                    ],
                  );
                });
            countDown = SETTING_TIME;
            pastTime = SETTING_TIME;
            setState(() {
              isPause = false;
              textColor = Colors.red;
            });
          }
        });
      }
    }

    String padStr(int value) {
      return value.toString().padLeft(2, '0');
    }

    String parseStr() {
      return '${padStr(countDown ~/ 60)}:${padStr(countDown % 60)}';
    }

    return Scaffold(
      body: Center(
        child: Text(
          parseStr(),
          style: TextStyle(fontSize: 50, color: textColor,fontFamily: "WawaSc"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startCountdown,
        child: Icon(isPause ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
