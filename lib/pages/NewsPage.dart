import 'package:flutter/material.dart';
import 'package:mobile_skeleton/bloc/NewsBloc.dart';
import 'package:mobile_skeleton/component/CommonLoadingWidget.dart';
import 'package:mobile_skeleton/model/BaseAllResponse.dart';
import 'package:mobile_skeleton/model/LoadApiStatus.dart';
import 'package:mobile_skeleton/model/response/GetNewsResponse.dart';
import 'package:mobile_skeleton/pages/NewsDetailPage.dart';
import 'package:mobile_skeleton/utils/SizeUtil.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsBloc newsBloc = NewsBloc();
  @override
  void initState() {
    newsBloc.getNewsData();
    super.initState();
  }

  @override
  void dispose() {
    newsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    double defaultSize = SizeUtil.defaultSize!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("News API"),
      ),
      body: SafeArea(
        child: Container(
          width: SizeUtil.screenWidth,
          padding: EdgeInsets.all(15),
          child: StreamBuilder(
              stream: newsBloc.newsSubject.stream,
              builder: (context,
                  AsyncSnapshot<BaseAllResponse<GetNewsResponse>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.status == LoadApiStatus.LOADING) {
                    return CommonLoadingWidget();
                  } else if (snapshot.data!.status == LoadApiStatus.COMPLETED) {
                    var newsResponse = snapshot.data!.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: newsResponse!.articles!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var newsItem = newsResponse.articles![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetailPage(article: newsItem)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: defaultSize * 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Image.network(
                                      newsItem.urlToImage!,
                                      fit: BoxFit.contain,
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsItem.title!,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        newsItem.publishedAt!,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.data!.status == LoadApiStatus.ERROR) {
                    return buildErrorWidget();
                  } else {
                    return buildErrorWidget();
                  }
                } else {
                  return CommonLoadingWidget();
                }
              }),
        ),
      ),
    );
  }

  Widget buildErrorWidget() {
    return Stack(
      children: [
        Container(
          height: SizeUtil.screenHeight,
          width: SizeUtil.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Silahkan tarik kebawah untuk memuat data kembali.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        ListView()
      ],
    );
  }
}
