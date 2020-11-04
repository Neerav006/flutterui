import 'package:counter_app/bottomnavbar/fragment_four.dart';
import 'package:counter_app/bottomnavbar/fragment_one.dart';
import 'package:counter_app/bottomnavbar/fragment_three.dart';
import 'package:counter_app/bottomnavbar/fragment_two.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> with AutomaticKeepAliveClientMixin{
  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.80
  );

  List<Widget> _pageList= [
    FragmentOne(
      key: PageStorageKey('1'),
    ),
    FragmentTwo(
      key: PageStorageKey('2'),
    ),
    FragmentThree(
      key: PageStorageKey('3'),
    ),
    FragmentFour(
      key: PageStorageKey('4'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),

      body: PageView(
        controller: _controller,
        children: _pageList,
        onPageChanged: (page){

        },

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
