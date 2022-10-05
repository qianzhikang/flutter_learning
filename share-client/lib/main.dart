import 'package:flutter/material.dart';
import 'package:share_client/page/home_page.dart';
import 'package:share_client/page/login_page.dart';
import 'package:share_client/utils/dio_request.dart';
import 'package:share_client/utils/share_preferences_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page/share_detail_page.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Request request = Request();
void main() async{
  // SharedPreferences.setMockInitialValues({});
  // main 函数初始化声明
  WidgetsFlutterBinding.ensureInitialized();
  // 实例化 shared_preferences
  await SpUtils.getInstance();

  // 初始化 dio 请求库
  request.init(
    baseUrl: 'http://localhost:8083/api/v1/',
    responseFormat: HttpResponseFormat('code', 'data', 'msg', '1'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // home: ArticleaDetails(imageUrl: 'https://img2.sycdn.imooc.com/szimg/5b3082da0001d7e905400300-360-202.jpg',
      // title: "hello",content: "hello",description: "hello",time:"2022-02-02",author: "qzk",url: "www.baidu.com"),
    );
  }
}

// void main() async {
//   request.init(
//     baseUrl: 'http://api.w2gd.top:10001/api/v1/',
//     // baseUrl: 'http://localhost:10001/api/v1/',
//     responseFormat: HttpResponseFormat('code', 'data', 'msg', '1'),
//   );
//   WidgetsFlutterBinding.ensureInitialized();
//   await SpUtils.getInstance();
//
//   runApp(const MyApp());
// }