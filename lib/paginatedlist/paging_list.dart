import 'dart:convert';

import 'package:counter_app/model/JsonPlaceHolderPhotoes.dart';
import 'package:counter_app/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class PagingList extends StatefulWidget {
  @override
  _PagingListState createState() => _PagingListState();
}

class _PagingListState extends State<PagingList> {
  var pageStart = 0;
  var pageEnd = 10;
  var lastPage = 5000;
  var isLoading = false;
  List<JsonPlaceHolderPhotos> jsonPhotosList;
  Future<List<JsonPlaceHolderPhotos>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    // root layout future builder for update widget from future data
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        if (snapshot.hasError) {
          print("${snapshot.error}");
          return Container();
        }

        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: snapshot.data == null || snapshot.data.isEmpty
                  ? Container()
                    // scroll listener
                  : NotificationListener<ScrollNotification>(
                      // ignore: missing_return
                      onNotification: (ScrollNotification scrollInfo) {
                        if (!isLoading &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent &&
                            pageEnd <= lastPage) {
                          print("Reach scroll end:---");
                          this.fetchAlbum();
                        }
                      },
                      child: buildListView(snapshot),
                    ),
            ),
            isLoading ? Center(child: CircularProgressIndicator()) : Container()
          ],
        );
      },
      future: futureData,
    );
  }

  // List view
  ListView buildListView(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemBuilder: (context, position) {
        JsonPlaceHolderPhotos jsonPhotos = snapshot.data[position];
        return InkWell(
          onTap: () {
            print("clicked item: $position");
          },
          child: buildCard(context, jsonPhotos),
        );
      },
      itemCount: snapshot.data?.length,
    );
  }

  // List view item row.
  Card buildCard(BuildContext context, JsonPlaceHolderPhotos jsonPhotos) {
    return Card(
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
              backgroundImage: jsonPhotos?.thumbnailUrl != null
                  ? NetworkImage(jsonPhotos?.thumbnailUrl)
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
                    jsonPhotos?.id.toString() ?? "",
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w700,
                        fontSize:
                            ResponsiveWidget.isSmallScreen(context) ? 15 : 17),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    jsonPhotos?.title ?? "",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize:
                            ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Async method for fetch list of data from api
  Future<List<JsonPlaceHolderPhotos>> fetchAlbum() async {
    print("Loading from :${pageStart} to ${pageEnd}");
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        'https://jsonplaceholder.typicode.com/photos?_start=$pageStart&_end=$pageEnd');
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<JsonPlaceHolderPhotos> posts = (json.decode(response.body) as List)
          .map((e) => new JsonPlaceHolderPhotos.fromJson(e))
          .toList();
      if (jsonPhotosList == null) {
        jsonPhotosList = posts;
      } else {
        jsonPhotosList.addAll(posts);
      }
      print("post size:${jsonPhotosList?.length}");
      pageStart = jsonPhotosList.last.id;
      pageEnd = pageStart + 10;
      return jsonPhotosList;
      // throw Exception('Failed to load album');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
