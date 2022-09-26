import 'package:flutter/material.dart';
import 'package:flutter_code/route/first_page.dart';
import 'package:flutter_code/route/one_page.dart';
import 'package:flutter_code/route/second_page.dart';
import 'package:flutter_code/route/thired_page.dart';
import 'package:flutter_code/route/two_page.dart';
import 'package:flutter_code/route/unknown_page.dart';
import 'package:flutter_code/style-widget/button.dart';
import 'package:flutter_code/style-widget/placeholder-demo.dart';
import 'package:flutter_code/tomato%E2%80%94clock/clock_page.dart';

import 'animation/animation_page.dart';
import 'communication/event_bus/profile_page.dart';
import 'communication/inherited/count_page.dart';
import 'communication/notification/notification_page.dart';
import 'layout/cake_page.dart';
import 'layout/stack_demo.dart';
import 'layout/store_page.dart';
import 'listview/page/splash_page.dart';
import 'net-request/request/dio_demo_page.dart';
import 'net-request/request/http_client_page.dart';
import 'net-request/request/http_demo_page.dart';

void main() {
  runApp(const MyApp());
  // layout 中的
  // runApp(const StorePage());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'page_one':(context)=>FirstPage(),
        'page_two':(context)=>SecondPage(),
        'page_three':(context)=>ThiredPage(),

        'one_page':(context)=>OnePage(),
        'two_page':(context)=>TwoPage(),
      },
      onUnknownRoute: (RouteSettings setting)=>MaterialPageRoute(builder: (context)=>UnknownPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAppState(),
    );
  }
}

class MyAppState extends StatelessWidget {
  const MyAppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter code'),),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const SplashPage()));
                },
                child: const Text('Code Lab'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const CakePage()));
                },
                  child: const Text('自绘组件'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const ButtonDemo()));
                },
                  child: const Text('自定义button'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const PlaceholderDemo()));
                },
                  child: const Text('图片缓存'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const StackDemo()));
                },
                  child: const Text('Stack布局'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const ClockPage()));
                },
                  child: const Text('番茄钟'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const AnimationPage()));
                },
                  child: const Text('动画'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const FirstPage()));
                },
                  child: const Text('路由相关'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const OnePage()));
                },
                  child: const Text('路由计算器'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const CountPage()));
                },
                  child: const Text('inherited 跨组件通信'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const NotificationPage()));
                },
                  child: const Text('notification 跨组件通信'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfilePage()));
                },
                  child: const Text('eventbus 跨组件通信'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const HttpClientDemo()));
                },
                  child: const Text('http client网络请求'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const HttpDemo()));
                },
                  child: const Text('http 网络请求'),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const DioDemo()));
                },
                  child: const Text('dio 网络请求'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

/*
*  PlaceholderDemo
*
*
*
* */