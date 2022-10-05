// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/config.dart';

class ArticleaDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  String? content;
  final String description;
  final String time;
  final String author;
  final String url;

  ArticleaDetails({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.content,
    required this.description,
    required this.time,
    required this.author,
    required this.url,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("分享详情"),
        backgroundColor: Config.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SafeArea(
          left: false,
          right: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 8.0),
                      width: 150,
                      child: Text(
                        "发布人：${author}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                    Text(
                      "创建于：$time",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0,),
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${description}.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        content!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     launch(url);
                    //   },
                    //   child: Text(
                    //     url,
                    //     maxLines: 2,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: GoogleFonts.montserrat(
                    //       color: Colors.blue,
                    //       fontSize: 18,
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
