import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/style.dart';
import '../widget/app_bottom_bar.dart';
import '../widget/app_header.dart';
import '../widget/app_list.dart';
import '../widget/app_search.dart';
import '../widget/app_type_list.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Icon(
            Icons.terrain,
            size: 40,
          ),
        ),
        // leading: const Icon(
        //   Icons.list,
        //   color: mainColor,
        //   size: 40,
        // ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.settings,
              size: 32,
            ),
          ),
        ],
        iconTheme: IconThemeData(color: mainColor),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          const AppHeader(),
          Divider(
            color: Colors.grey.shade300,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SearchPage(),
          const AppList(),
          Expanded(
              child: Container(
                // color: mainColor,
                child: AppTypeList(),
              )
          ),
          const AppBottomBar(),
        ],
      ),
    );
  }
}
