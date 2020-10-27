import 'package:counter_app/aboutus/post_api_page.dart';
import 'package:counter_app/aboutus/stream_example.dart';
import 'package:counter_app/gridviewlist/GridViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
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
              icon: Icons.contact_phone, text: 'GridView', onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewPage(),));
          }),
          Divider(),
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
              child: Text("abc@gmail.com",
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
          Icon(icon,size: 24,),
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
