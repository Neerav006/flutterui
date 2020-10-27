import 'package:counter_app/responsive_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  bool isLoading = false;
  Dio dio = new Dio();
  List users = new List();
  int page = 0;
  ScrollController _sc = new ScrollController();
  var logger = Logger();

  @override
  void initState() {
    _getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Container(
        child: _buildListView(),
      ),
      //resizeToAvoidBottomPadding: false,
    );
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  // Fetch data from api
  void _getMoreData(int index) async {
    try {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        var url = "https://randomuser.me/api/?page=" +
            index.toString() +
            "&results=20&seed=abc&nat=gb";
        print(url);
        final response = await dio.get(url);
        // logger.e(response);
        List tList = new List();
        for (int i = 0; i < response.data['results'].length; i++) {
          tList.add(response.data['results'][i]);
        }

        setState(() {
          isLoading = false;
          users.addAll(tList);
          page++;
        });
      }
    } on DioError catch (e) {
      logger.e(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  // Listview Builder
  Widget _buildListView() {
    return Column(
      children: [
        users.isEmpty
            ? Container()
            : Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          ResponsiveWidget.isLandSacpeOrientation(context)
                              ? 3
                              : 2),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                              child: Image.network(
                                users[index]['picture']['large'],
                                fit: BoxFit.cover,
                              ),
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                        )
                      ],
                    );
                  },
                  itemCount: users.length,
                  controller: _sc,
                ),
              ),
        isLoading ? _buildProgressIndicator() : Container()
      ],
    );
  }

  // ProgressIndicator
  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
