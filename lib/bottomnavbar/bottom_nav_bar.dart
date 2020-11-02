import 'dart:async';

import 'package:counter_app/bottomnavbar/fragment_four.dart';
import 'package:counter_app/bottomnavbar/fragment_one.dart';
import 'package:counter_app/bottomnavbar/fragment_three.dart';
import 'package:counter_app/bottomnavbar/fragment_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex = 0;
  DateTime currentBackPressTime;
  List<Widget> _widgetList = [
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
  final PageStorageBucket bucket = PageStorageBucket();



  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop:_onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'One'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.place_rounded,
                ),
                label: 'Two'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people_alt_outlined,
                ),
                label: 'Three'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.contact_support_outlined,
                ),
                label: 'Four')
          ],
          onTap: (index) {
            setState(() {
              this.currentIndex = index;
            });
          },
        ),
        body:
       // PageStorage(bucket: bucket, child: _widgetList[currentIndex]),
        IndexedStack(
          index: currentIndex,
          children: _widgetList,
        )
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if(currentIndex!=0){
      setState(() {
        currentIndex = 0;
      });
      return Future.value(false);
    }

    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 1)) {
      currentBackPressTime = now;

      return Future.value(false);
    }

    return Future.value(true);
  }

}
