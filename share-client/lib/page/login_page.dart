import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:share_client/entity/user_model.dart';
import 'package:share_client/main.dart';
import 'package:share_client/page/home_page.dart';
import 'package:share_client/entity/login_model.dart';
import 'package:share_client/page/profile_page.dart';

import '../utils/share_preferences_util.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    print("初始化。。");
    _init();
  }

  void _init() async {
    // usernameController.text = "15962540975";
    // passwordController.text = "123123";
    String? username = SpUtils.getString('mobile');
    String? password = SpUtils.getString('password');
    print(username);
    print(password);
    if (username != "") {
      usernameController.text = username!;
      // passwordController.text = password!;
    }
  }

  Future<void> _login(String username, String password,BuildContext context) async {
    // 创建dio
    // Dio dio = Dio();
    // 设置 URI、请求头、请求体
    // var response = await dio.post("http://localhost:8083/api/v1/users/login",
    //     data: {"mobile": username, "password": password});
    var response = await request.post("/users/login",data: {
      "mobile": username, "password": password
    });
    LoginModel resData = LoginModel.fromJson(response);
    SpUtils.setInt('id', resData.id);
    SpUtils.setString('token', resData.token);

    // 请求结果
    // LoginModel resData = LoginModel.fromJson(json.decode(response));
    // print(resData.toString());
    // if(response.statusCode == HttpStatus.ok) {
    //   if(response.data['data'] != null) {
    //     print("登陆成功");
    //     print(response.data);
    //     LoginModel resData = LoginModel.fromJson(json.decode(response.toString()));
    //     var userRes = await dio.get('http://localhost:8083/api/v1/users/${resData.data.id}',
    //         options: Options(headers: {'X-Token':resData.data.token,})
    //         );
    //     print(userRes.data);
    //     UserModel userData = UserModel.fromJson(json.decode(userRes.toString()));
    //     // 本地持久化
    //     SpUtils.setInt('id', userData.data.id);
    //     SpUtils.setString('roles', userData.data.roles);
    //     SpUtils.setString('mobile', userData.data.mobile);
    //     SpUtils.setString('nickname', userData.data.nickname);
    //     SpUtils.setString('avatar', userData.data.avatar);
    //     SpUtils.setString('token', resData.data.token);
    //     // 路由添砖
    //     Navigator.push(
    //         // context, MaterialPageRoute(builder: (context) => const ProfileOnePage()));
    //         context, MaterialPageRoute(builder: (context) => const HomePage()));
    //   }else{
    //     print("用户名或密码不正确");
    //   }
    // } else {
    //   print("Error: ${response.statusCode}");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 26.0),
          width: 50,
          child: InkWell(
            onTap: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (_)=> HomePage()))
            },
              child: Text("取消",style: TextStyle(fontSize: 15,color: Colors.blue),)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-1.png'))),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-2.png'))),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/clock.png'))),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade100))),
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () => {
                      _login(usernameController.text, passwordController.text,context)
                          .then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage())))
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ])),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  // const Text(
                  //   "Forgot Password?",
                  //   style:
                  //       TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  // ),
                  const Text(
                    "Other Login",
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(IconData(0xe620, fontFamily: 'WechatFont'),
                      size: 40)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
