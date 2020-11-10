import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PageOne extends StatefulWidget {

  const PageOne({Key key}) : super(key: key);


  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {

  var logger = Logger();

  @override
  void initState() {
    super.initState();
    logger.i("One init");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0,16.0,16.0,16.0),
      child: Container(
         /*color: Colors.lightBlueAccent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Fragment One',
               style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),*/
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            'images/nature_one.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),

    );
  }
}
