import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PageTwo extends StatefulWidget {

  const PageTwo({Key key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  var logger = Logger();
  @override
  void initState() {
    super.initState();
    logger.i("two init");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0,16.0,16.0,16.0),
      child: Container(
        /*color: Colors.lightGreenAccent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '2',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Fragment Two',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),*/
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            'images/nature_two.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),

    );
  }
}
