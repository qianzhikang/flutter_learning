import 'package:flutter/material.dart';
import 'package:flutter_code/layout/stroe_model.dart';
import 'package:rf_expand_collapse_text/rf_expand_collapse_text.dart';


bool themeState = false;

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StorePageState();
}

class StorePageState extends State<StorePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: themeState ? Brightness.dark : Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Updates'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    themeState = !themeState;
                    // print(themeState);
                  });
                },
                child: const Icon(
                  Icons.settings,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          child: ListView.builder(
            itemCount: appList.length,
            itemBuilder: (context, index) {
              ItemModel model = appList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: UpdateItem(model.appIcon, model.appName, model.appSize,
                    model.appDate, model.appDescription, model.appVersion),
              );
            },
          ),
        ),
      ),
    );
  }
}

class UpdateItem extends StatefulWidget {

  final String appIcon;
  final String appName;
  final String appSize;
  final String appDate;
  final String appDescription;
  final String appVersion;

  UpdateItem(this.appIcon, this.appName, this.appSize, this.appDate,
      this.appDescription, this.appVersion);

  @override
  State<StatefulWidget> createState() => UpdateItemState(this.appIcon, this.appName, this.appSize, this.appDate,
      this.appDescription, this.appVersion);
}

class UpdateItemState extends State<UpdateItem> {
  final String appIcon;
  final String appName;
  final String appSize;
  final String appDate;
  final String appDescription;
  final String appVersion;

  UpdateItemState(this.appIcon, this.appName, this.appSize, this.appDate,
      this.appDescription, this.appVersion){
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    // print(themeState);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(appIcon), fit: BoxFit.fill)),
          ),
          title: Text(appName),
          subtitle: Text(appDate),
          trailing:
          OutlinedButton(onPressed: () {}, child: const Text('UPDATE')),
        ),
        Padding(
          padding: const EdgeInsets.all(11),
          child: RFExpandCollapseText(
            text: appDescription,
            textStyle: TextStyle(color: themeState?Colors.white:Colors.black, fontSize: 18),
            expandStr: '展开',
            collapseStr: '收起',
            expandOrCollapseStyle:
            const TextStyle(color: Colors.blue, fontSize: 18),
            maxLines: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11),
          child: Text(
            '$appVersion • $appSize',
          ),
        ),
        const Divider(height: 3, color: Colors.grey, indent: 10, endIndent: 10)
      ],
    );
  }
}
