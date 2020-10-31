import 'dart:convert';

import 'package:counter_app/appdrawer.dart';
import 'package:counter_app/gridviewlist/GridViewPage.dart';
import 'package:counter_app/homefeed/home_newsfeed.dart';
import 'package:counter_app/paginatedlist/pagination_home.dart';
import 'package:counter_app/paginatedlist/paging_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'model/Article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Articles> articleList = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    loadNews().then((value) {
      setState(() {
        this.articleList = value.articles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: "List",
              ),
              Tab(
                icon: Icon(Icons.grid_view),
                text: "Grid",
              )
            ],
            controller: _tabController,
          ),
        ),*/
        drawer: AppDrawer(),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(

            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  centerTitle: true,
                  floating: true,
                  pinned: true,
                  title: Text('Home'),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.list),
                        text: "List",
                      ),
                      Tab(
                        icon: Icon(Icons.grid_view),
                        text: "Grid",
                      )
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [PagingList(), GridViewPage()],
            ),
          ),
        )
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
