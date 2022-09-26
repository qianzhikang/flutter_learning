import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Day4Page extends StatelessWidget {
  const Day4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(window.physicalSize.width / 2);
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return Scaffold(
        backgroundColor: Colors.indigo.shade100,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              // 显示超出stack大小部分
              clipBehavior: Clip.none,
              children: [
                // 图片部分下衍生，利用margin挤下去
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 350,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.shade700.withOpacity(0.8),
                    ),
                  ),
                ),
                ClipPath(
                  // 图片底部裁剪（第三方包）
                  clipper: OvalBottomBorderClipper(),
                  //头部背景图
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar04.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      color: Colors.yellowAccent.shade200.withOpacity(0.5),
                    ),
                  ),
                ),
                Positioned(
                  // 获取当前容器的width，减去自身宽度 / 2 来居中
                  left: (MediaQuery.of(context).size.width - 300) / 2,
                  top: 120,
                  child: Column(
                    children: [
                      Container(
                          child: const Text(
                        'Profile',
                        style: TextStyle(fontSize: 22),
                      )),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              'https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar04.jpeg'),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'qzk',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('flutter developer'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 20,
                                spreadRadius: 1),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'test',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text('Followers')
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'test',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text('Followers')
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Favorite',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 200,
                  child: const _List(),
                )
              ],
            )
          ],
        ));
  }
}

class _List extends StatelessWidget {
  const _List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 160,
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  margin: EdgeInsets.fromLTRB(14, 40, 0, 0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue.shade700),
                ),
                Container(
                  width: 140,
                  height: 140,
                  margin: EdgeInsets.fromLTRB(8, 20, 0, 0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.purpleAccent.shade400),
                ),
                Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar04.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
