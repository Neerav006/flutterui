import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FragmentTwo extends StatefulWidget {

  const FragmentTwo({Key key}) : super(key: key);

  @override
  _FragmentTwoState createState() => _FragmentTwoState();
}

class _FragmentTwoState extends State<FragmentTwo> {
  var logger = Logger();
  @override
  void initState() {
    super.initState();
    logger.i("two init");
  }

  @override
  Widget build(BuildContext context) {
   return Center(child: Container(
      child: Column(
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
      ),

    ));
  }
}
