
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  State<HttpDemo> createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  httpGet() async {
    // 创建示例
    var client = http.Client();
    // 构造URI,配置请求头和请求体
    var uri = Uri.parse("http//:localhost:8080/greet");
    http.Response response = await client.get(uri, headers : {"user-agent" : "Custom-UA"});
    // 返回结果输出
    if(response.statusCode == HttpStatus.ok) {
      print(response.body);
    } else {
      print("Error: ${response.statusCode}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Http Demo'),
    );
  }
}
