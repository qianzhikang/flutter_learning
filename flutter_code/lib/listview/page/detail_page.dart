import 'package:flutter/material.dart';

import '../global/style.dart';

class CoverDetail extends StatelessWidget {
  const CoverDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Icon(
            Icons.terrain,
            color: Colors.white,
            size: 36,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.message,
              color: Colors.white,
              size: 32,
            ),
          )
        ],
      ),
      body: BodyWidget(),
    );
  }
}

/// Body类
class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 400,
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              image: DecorationImage(
                image: NetworkImage(
                    'https://pic-go.oss-cn-shanghai.aliyuncs.com/banner/banner1.jpg'),
                fit: BoxFit.cover,
              )),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mount Semeru',
                  style: lightTitleStyle,
                ),
                Text(
                  'Java',
                  style: lightSubTitleStyle,
                )
              ],
            ),
          ),
        ),
        const _InfoBox(),

        /// 文字部分
        Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('How to learn Java',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('How to learn Java How to learn Java How to learn Java How to learn Java How to learn Java',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
        ),

        Expanded(child: Container()),
        const _Bottom(),
      ],
    );
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[TextBox(), TextBox(), TextBox()],
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Java',
              style: titleStyle,
            ),
            Text(
              '10000',
              style: summaryStyle,
            )
          ],
        ),
      ),
    );
  }
}

/// 底部
class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Learn more',
                  style: lightTitleStyle,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: mainColor, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.mark_as_unread,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
