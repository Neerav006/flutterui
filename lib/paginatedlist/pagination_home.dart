import 'package:counter_app/paginatedlist/paging_list.dart';
import 'package:counter_app/responsive_widget.dart';
import 'package:flutter/material.dart';

class PaginatedHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: ResponsiveWidget(
           smallScreen: PagingList(),
           mediumScreen: PagingList(),
           largeScreen: PagingList(),
         ),
    );
  }
}
