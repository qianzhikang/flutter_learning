import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientDemo extends StatefulWidget {
  const HttpClientDemo({Key? key}) : super(key: key);

  @override
  State<HttpClientDemo> createState() => _HttpClientDemoState();
}

class _HttpClientDemoState extends State<HttpClientDemo> {
  void _getHttp() async {
    HttpClient httpClient = HttpClient();
    httpClient.idleTimeout = const Duration(seconds: 10);
    var uri = Uri.parse("http://localhost:8080/greet");
    var request = await httpClient.getUrl(uri);
    request.headers.add("user-agent", "Custom-UA");
    // 发起请求，等待响应
    var response = await request.close();

    // 收到响应，打印结果
    if (response.statusCode == HttpStatus.ok) {
      print(await response.transform(utf8.decoder).join());
    } else {
      print('Error: \nHttp status ${response.statusCode}');
    }
  }


  @override
  void initState() {
    _getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpClient Demo'),
      ),
    );
  }
}
