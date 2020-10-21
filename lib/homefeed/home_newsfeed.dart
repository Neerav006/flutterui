import 'package:counter_app/homefeed/feed_list.dart';
import 'package:counter_app/model/Article.dart';
import 'package:counter_app/responsive_widget.dart';
import 'package:flutter/material.dart';

class NewsFeedPage extends StatelessWidget {
   final List<Articles> articleList;

   const NewsFeedPage({Key key, this.articleList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ResponsiveWidget(
         smallScreen: Center(child: FeedList(articleList: this.articleList,)),
         mediumScreen: Center(child: FeedList(articleList: this.articleList,)),
       ),
    );
  }


}
