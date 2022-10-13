import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_client/page/new_page.dart';
import 'package:share_client/page/profile_page.dart';
import 'package:share_client/page/share_detail_page.dart';
import 'package:share_client/theme/config.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entity/notice_model.dart';
import '../entity/share_model.dart';
import '../main.dart';
import '../model/ad_model.dart';
import '../widget/scroller_pic_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Widget _currBody = HomeState();

  _onTap(int index) {
    switch (index) {
      case 0:
        _currBody = HomeState();
        break;
      case 1:
        _currBody = NewPage();
        break;
      case 2:
        _currBody = ProfileOnePage();
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Config.primaryColor),
      home: Scaffold(
        body: _currBody,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _onTap(index),
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Config.primaryColor,
          // type:BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "new"),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: "personal",
            ),
          ],
        ),
      ),
    );
  }
}

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  Future<List<Content>>? list;
  List<String> _loopList = ['公告服务暂停'];
  int pageNum = 0;
  int pageSize = 5;

  /// 刷新控制器，初始化刷新为false，自定义初始化在 initState 中
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    setState(() {
      list = _getData(pageNum, pageSize);
      _getNotices(0, 5);
    });
  }

  /// 获取数据
  Future<List<Content>> _getData(int pageNum, int pageSize) async {
    var resData = await request.get("/content/page-shares",
        params: {"pageNum": pageNum, "pageSize": pageSize});
    ShareModel shareModel = ShareModel.fromJson(resData);
    List<Content> contentList = shareModel.content;
    if (contentList.isEmpty) {
      _refreshController.loadNoData();
      return Future(() => []);
    } else {
      return contentList;
    }
  }

  /// 获取公告
   _getNotices(int pageNum, int pageSize) async {
    var resData = await request.get("/notices/page-notices",
        params: {"pageNum": pageNum, "pageSize": pageSize});
    NoticeModel noticeModel = NoticeModel.fromJson(resData);
    List<NoticeContent> noticeList = noticeModel.content;
    _loopList.length = 0;
    noticeList.forEach((element) {
      _loopList.add(element.content);
    });
    print(_loopList);
  }

  /// 刷新 重新赋值
  void _onRefresh() async {
    /// 为了显示动画 延迟加载
    await Future.delayed(Duration(milliseconds: 1000));

    /// 还原请求参数
    pageNum = 0;
    pageSize = 10;
    setState(() {
      list = _getData(pageNum, pageSize);
    });
    _refreshController.refreshCompleted();

    /// 为了重置 没有更多 的显示
    _refreshController.loadComplete();
  }

  /// 加载 addAll()
  void _onLoading() async {
    /// 为了显示动画 延迟加载
    await Future.delayed(Duration(milliseconds: 1000));

    list?.then((value) async {
      /// 页码 加一 size不变
      pageNum++;
      List<Content> moreData = await _getData(pageNum, pageSize);
      value.addAll(moreData);
    });
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Config.primaryColor,
      ),
      body: contentListView(context),
    );
  }

  /// 列表组件
  Widget contentListView(BuildContext context) {
    // url 跳转
    _launchUrl(url) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    }

    return FutureBuilder(
      future: list,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Content> contents = snapshot.data;
          return SizedBox(
            height: snapshot.data.length * 211.toDouble(),
            child: SmartRefresher(
                controller: _refreshController,
                enablePullUp: true,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      Content share = contents[index];
                      if (index == 0) {
                        return Column(
                          children: [
                            /// 轮播图
                            SizedBox(
                              height: 200,
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _launchUrl(swiperList[index].adUrl);
                                    },
                                    child: Image.network(
                                      swiperList[index].imgUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                                itemCount: swiperList.length,
                                pagination: SwiperPagination(),
                                control: SwiperControl(),
                                autoplay: true,
                              ),
                            ),

                            ///轮播公告
                            Container(
                              height: 50,
                              color: Colors.grey.shade100,
                              child: buildMarqueeWidget(_loopList), // 公告滚动
                            ),
                            contentCard(context, share)
                          ],
                        );
                      } else {
                        return contentCard(context, share);
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Colors.grey,
                      );
                    },
                    itemCount: contents.length)),
          );
        } else {
          /// 这里显示屏幕中间 loading 加载中的样式
          return const CupertinoActivityIndicator();
        }
      },
    );
  }

  /// 条目组件
  Widget contentCard(BuildContext context, Content content) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ArticleaDetails(
                      imageUrl: content.cover,
                      title: content.title,
                      content: content.downloadUrl,
                      description: content.summary,
                      time: content.createTime,
                      author: content.author,
                      url: content.downloadUrl,
                    )))
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              padding: EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(content.cover),
                      radius: 80,
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 35,
                    alignment: Alignment.center,
                    color: content.isOriginal == 1
                        ? Colors.deepOrangeAccent
                        : Colors.lightGreen,
                    child: Text(
                      content.isOriginal == 1 ? "原创" : "转载",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  content.summary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [Text("${content.buyCount}积分"), const Text("兑换")],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///上下轮播 安全提示
  Widget buildMarqueeWidget(List<String> loopList) {
    return MarqueeWidget(
      //子Item构建器
      itemBuilder: (BuildContext context, int index) {
        String itemStr = loopList[index];
        //通常可以是一个 Text文本
        return Row(
          children: [
            const SizedBox(width: 15),
            const Icon(Icons.notifications_active),
            Text(itemStr, style: const TextStyle(color: Colors.blue, fontSize: 15)),
          ],
        );
      },
      //循环的提示消息数量
      count: loopList.length,
    );
  }
}
