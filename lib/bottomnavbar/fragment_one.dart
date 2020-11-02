import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FragmentOne extends StatefulWidget {

  const FragmentOne({Key key}) : super(key: key);


  @override
  _FragmentOneState createState() => _FragmentOneState();
}

class _FragmentOneState extends State<FragmentOne> {

  var logger = Logger();

  @override
  void initState() {
    super.initState();
    logger.i("One init");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
       child: Column(
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
       ),

    ));
  }
}
