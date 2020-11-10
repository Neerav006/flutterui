import 'package:counter_app/bottomnavbar/fragment_four.dart';
import 'package:counter_app/bottomnavbar/fragment_one.dart';
import 'package:counter_app/bottomnavbar/fragment_three.dart';
import 'package:counter_app/bottomnavbar/fragment_two.dart';
import 'package:counter_app/pageview/page_four.dart';
import 'package:counter_app/pageview/page_one.dart';
import 'package:counter_app/pageview/page_three.dart';
import 'package:counter_app/pageview/page_two.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> with AutomaticKeepAliveClientMixin{
  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.8
  );

  List<Widget> _pageList= [
    PageOne(
      key: PageStorageKey('1'),
    ),
    PageTwo(
      key: PageStorageKey('2'),
    ),
    PageThree(
      key: PageStorageKey('3'),
    ),
    PageFour(
      key: PageStorageKey('4'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,16.0),
        child: PageView(
          controller: _controller,
          children: _pageList,
          onPageChanged: (page){

          },

        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
