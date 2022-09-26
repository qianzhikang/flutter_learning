import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Day3Page extends StatelessWidget {
  const Day3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color color1 = Color(0xff40e1d4);
    const Color color2 = Color(0xff87d3b9);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // 部渐变容器下万两角圆弧
            height: 360,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          ///
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                const Text(
                  "About Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        //头像容器
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar04.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        //顶部橙色信息框
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Flutter Developer"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'qzkqzk',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, color: Colors.red),
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.location_on, size: 16.0, color: Colors.grey),
                    Text(
                      "nanjing jiangsu",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  //社交按钮
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      color: Colors.blue,
                      icon: const Icon(FontAwesomeIcons.weixin),
                      onPressed: () {},
                    ),
                    IconButton(
                      color: Colors.green,
                      icon: const Icon(FontAwesomeIcons.apple),
                      onPressed: () {},
                    ),
                    IconButton(
                      color: Colors.red.shade600,
                      icon: const Icon(FontAwesomeIcons.bilibili),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      Container(
                        //底部渐变容器
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [color1, color2],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          //行布局的图标按钮
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.verified_user),
                              onPressed: () {},
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.location_on),
                              onPressed: () {},
                            ),
                            const Spacer(),
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.message),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///
          AppBar(
            // AppBar,要最后放，不然会被后面的组件覆盖掉，就看不到了
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

