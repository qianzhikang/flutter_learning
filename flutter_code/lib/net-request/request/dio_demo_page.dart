
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({Key? key}) : super(key: key);

  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {

  void getRequest() async {
    // 创建dio
    Dio dio = Dio();

    // 设置 URI、请求头、请求体
    var response = await dio.get("http//:localhost:8080/greet", options:Options(headers: {"user-agent" : "Custom-UA"}));

    // 请求结果
    if(response.statusCode == HttpStatus.ok) {
      print(response.data.toString());
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('dio demo'),
    );
  }
}
