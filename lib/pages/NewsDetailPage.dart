import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_skeleton/model/response/ArticlesResponse.dart';
import 'package:mobile_skeleton/utils/SizeUtil.dart';

class NewsDetailPage extends StatefulWidget {
  final ArticlesResponse article;
  NewsDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    double defaultSize = SizeUtil.defaultSize!;

    var formatDateTime = DateTime.parse(widget.article.publishedAt!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: SizeUtil.screenWidth,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.article.urlToImage!,
                  height: defaultSize * 25,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(formatDateTime),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.article.title!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.article.source!.name!,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.article.content!,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
