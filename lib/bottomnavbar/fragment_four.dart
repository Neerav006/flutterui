import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FragmentFour extends StatefulWidget {

  const FragmentFour({Key key}) : super(key: key);

  @override
  _FragmentFourState createState() => _FragmentFourState();
}

class _FragmentFourState extends State<FragmentFour> {

  var logger = Logger();
  @override
  void initState() {
    super.initState();
    logger.i("Four init");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Column(
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

    ));
  }
}
