import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PageFour extends StatefulWidget {

  const PageFour({Key key}) : super(key: key);

  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {

  var logger = Logger();
  @override
  void initState() {
    super.initState();
    logger.i("Four init");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0,16.0,0.0,16.0),
      child: Container(
      /*  color: Colors.lightBlueAccent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '4',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Fragment Four',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),*/
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        'images/nature_four.jpg',
        fit: BoxFit.fill,
      ),
    ),
    ),
    );
  }
}
