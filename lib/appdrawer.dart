import 'package:counter_app/aboutus/post_api_page.dart';
import 'package:counter_app/aboutus/stream_example.dart';
import 'package:counter_app/basicwidgets/basic_widget.dart';
import 'package:counter_app/bottomnavbar/bottom_nav_bar.dart';
import 'package:counter_app/googlemap/google_map.dart';
import 'package:counter_app/gridviewlist/GridViewPage.dart';
import 'package:counter_app/pageview/page_view.dart';
import 'package:counter_app/webviews/webview_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localdb/local_db_example.dart';

class AppDrawer extends StatelessWidget {

  final String email;
  final Function onLogOutPressed;
  const AppDrawer({Key key, @required this.email,@required this.onLogOutPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts, text: 'Post Api', onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => PostApiPage()));
          }),
          _createDrawerItem(icon: Icons.event, text: 'Stream Example', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => StreamExample()));
          }),
          _createDrawerItem(
              icon: Icons.contact_phone, text: 'BottomNavigation', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
          }),
          _createDrawerItem(
              icon: Icons.airplay_rounded, text: 'PageView', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewWidget(),));
          }),
          _createDrawerItem(
              icon: Icons.web, text: 'WebView', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(),));
          }),
          _createDrawerItem(
              icon: Icons.map, text: 'Map', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapSample(),));
          }),
          _createDrawerItem(
              icon: Icons.map, text: 'Local DB', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => LocalDbExample(),));
          }),
          Divider(),
          _createDrawerItem(
              icon: Icons.widgets, text: 'Widgets', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => BasicWidgetExp(),));
          }),
          Divider(),
          _createDrawerItem(
              icon: Icons.logout, text: 'LogOut', onTap: onLogOutPressed),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Container(
            color: Colors.deepPurple,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0,0.0,16.0,0.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage:
                AssetImage("images/dr_sample.jpg"),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(email??"",
                   textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon,size: 24,color: Colors.lightBlueAccent,),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

