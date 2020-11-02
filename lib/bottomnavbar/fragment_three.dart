import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FragmentThree extends StatefulWidget {

  const FragmentThree({Key key}) : super(key: key);

  @override
  _FragmentThreeState createState() => _FragmentThreeState();
}

class _FragmentThreeState extends State<FragmentThree> {

  var logger = Logger();

  @override
  void initState() {
    super.initState();
    logger.i("three init");
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '3',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'Fragment Three',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),

    ));
  }
}
