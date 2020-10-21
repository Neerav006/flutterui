import 'package:counter_app/model/Article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive_widget.dart';

class FeedList extends StatelessWidget {
  final List<Articles> articleList;

  const FeedList({Key key, this.articleList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

      builder: (BuildContext context, BoxConstraints constraints) {
       return Padding(
          padding: const EdgeInsets.all(8.0),
          child: articleList == null
              ? Container()
              : ListView.builder(
            itemBuilder: (context, position) {
              return InkWell(
                onTap: () {
                  print("clicked item: $position");
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: ResponsiveWidget.isSmallScreen(context)
                              ? 35
                              : ResponsiveWidget.isMediumScreen(context)
                              ? 40
                              : 45,
                          backgroundImage:
                          articleList[position]?.urlToImage != null
                              ? NetworkImage(
                              articleList[position]?.urlToImage)
                              : AssetImage("images/dr_sample.jpg"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                articleList[position]?.title ?? "",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'RobotoMono',
                                    fontWeight: FontWeight.w700,
                                    fontSize: ResponsiveWidget.isSmallScreen(
                                        context)
                                        ? 15
                                        : 17),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                articleList[position]?.description ?? "",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: ResponsiveWidget.isSmallScreen(
                                        context)
                                        ? 14
                                        : 16),
                              )
                            ],
                          ),
                        ),
                        ResponsiveWidget.isSmallScreen(context)
                            ? Container()
                            : Container(
                          height: constraints.maxHeight*0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                articleList[position]?.publishedAt ?? "",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize:
                                    ResponsiveWidget.isSmallScreen(
                                        context)
                                        ? 14
                                        : 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: articleList?.length,
          ),
        );
      },

    );
  }
}
