import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo.shade300,
                    Colors.indigo.shade500,
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: _buildBody,
            ),
          ],
        ),
      );
  }

  Widget _buildBody(BuildContext context, int index) {
    if (index == 0) {
      return _buildHeader(context);
    } else if (index == 1) {
      return _buildSectionHeader(context);
    } else if (index == 2) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Text(
          'More liked post',
          style: Theme.of(context).textTheme.headline4,
        ),
      );
    } else {
      return _buildListItem(context);
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      height: 280,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8.0,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Flutter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'UI Designer | Flutter Devloper',
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '320',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'POST',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '320',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'POST',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '320',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'POST',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Material(
                elevation: 12,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar04.jpeg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Collection',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Text(
                  'Create new',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    child: Column(
                      children: [
                        Image.network(
                          'https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar01.jpg',
                          fit: BoxFit.fitHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "test",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      height: 200,
      child: Image.network(
          'https://pic-go.oss-cn-shanghai.aliyuncs.com/banner/banner1.jpg',),
    );
  }
}
