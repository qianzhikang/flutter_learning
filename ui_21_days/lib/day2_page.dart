import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTwoPage extends StatelessWidget {
  const ProfileTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark);
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://pic-go.oss-cn-shanghai.aliyuncs.com/banner/banner33.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 120, 16, 16),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(top: 32), //这个很重要，让头像上浮
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(180),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 100), //名片上半部分留出左边距
                              child: _buildColumn(context), //构建名片上半部分
                            ),
                            const SizedBox(height: 5),
                            _buildRow(), //构建名片下半部分
                          ],
                        ),
                      ),
                      // 头像
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: NetworkImage('https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar04.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.white.withAlpha(160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "User Information",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          leading: const Icon(Icons.person),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListView(
                            shrinkWrap: true,
                            children: infoList
                                .map((info) => SizedBox(
                                height: 80,
                                child: ListTile(
                                  title: Text(info.title),
                                  subtitle: Text(info.subTitle),
                                  leading: Icon(info.icon),
                                )))
                                .toList()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建名片上方区域
  Column _buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Flutter Developer",
          style: Theme.of(context).textTheme.headline4,
        ),
        const ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text("Flutter Developer"),
          subtitle: Text("qzkqzk"),
        ),
      ],
    );
  }

  /// 构建名片下方一行三列区域
  Row _buildRow() {
    return Row(
      children: [
        Expanded(
            child: Column(
              children: const [Text('999'), Text('Likes')],
            )),
        Expanded(
            child: Column(
              children: const [Text('999'), Text('Comments')],
            )),
        Expanded(
            child: Column(
              children: const [Text('999'), Text('Favourites')],
            ))
      ],
    );
  }
}

//封装下方列表数据
class Info {
  IconData icon;
  String title;
  String subTitle;
  Info(this.icon, this.title, this.subTitle);
}

List<Info> infoList = [
  Info(Icons.email, 'Email', 'qzkqzk@gmail.com'),
  Info(Icons.phone, 'Phone', '+86-1000000000000'),
  Info(Icons.web, 'Website', 'www.qianzhikang.com'),
  Info(Icons.code, 'Github', 'https://www.github.com'),
  Info(Icons.calendar_view_day, 'Join Date', '12 September 2022'),
];
