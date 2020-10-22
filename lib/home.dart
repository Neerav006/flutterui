import 'dart:convert';

import 'package:counter_app/appdrawer.dart';
import 'package:counter_app/homefeed/home_newsfeed.dart';
import 'package:counter_app/paginatedlist/pagination_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'model/Article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Articles> articleList = [];

  @override
  void initState() {
    super.initState();
    loadNews().then((value) {
         setState(() {
           this.articleList = value.articles;
         });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Home"),),
       drawer: AppDrawer(),
       body: PaginatedHome()
      // NewsFeedPage(articleList: this.articleList,),

    );
  }

  Future<String> _loadNewsAsset() async {
    return await rootBundle.loadString('images/news.json');
  }

  Future<NewsData> loadNews() async {
    String jsonString = await _loadNewsAsset();
    final jsonResponse = json.decode(jsonString);
    return new NewsData.fromJson(jsonResponse);
  }
}
