import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlaceholderDemo extends StatefulWidget {
  const PlaceholderDemo({Key? key}) : super(key: key);

  @override
  State<PlaceholderDemo> createState() => PlaceholderState();
}

class PlaceholderState extends State<PlaceholderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("图片占位符")),
      body: Center(
        child: Column(
          children: <Widget>[
            FadeInImage.assetNetwork(
                placeholder: "assets/pictures/loading.gif",
                image:
                    "https://tuapi.eees.cc/dongman/pc/TUAPI-EEES-CC-2062114731.jpg"),
            const Divider(),
            CachedNetworkImage(
              imageUrl: "https://tuapi.eees.cc/dongman/pc/TUAPI-EEES-CC-2062114731.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
