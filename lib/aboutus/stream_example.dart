import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class StreamExample extends StatefulWidget {
  @override
  _StreamExampleState createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  StreamController<int> _streamController = StreamController();
  var logger = Logger();
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    // _streamController.addStream(_randomNum());
    _streamSubscription = _randomNum().listen((event) {
      _streamController.add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
        child: Container(
          alignment: FractionalOffset.center,
          color: Colors.white,
          child: StreamBuilder<int>(
            stream: _streamController.stream,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              logger.e(snapshot.connectionState);
              List<Widget> children;
              if (snapshot.hasError) {
                children = <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    children = <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Select a lot'),
                      )
                    ];
                    break;
                  case ConnectionState.waiting:
                    children = <Widget>[
                      SizedBox(
                        child: const CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Waiting for data...'),
                      )
                    ];
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    children = <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('${snapshot.data}'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // if it is running than show stop button
                      !_streamSubscription.isPaused
                          ? OutlineButton(
                              onPressed: () {
                                setState(() {
                                  _streamSubscription.pause();
                                });

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("STOP",style: TextStyle(
                                   fontSize: 20
                                ),),
                              ))
                           // else show start button
                          : OutlineButton(
                              onPressed: () {
                               setState(() {
                                 _streamSubscription.resume();
                               });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("START",style: TextStyle(
                                     fontSize: 20
                                ),),
                              ))
                    ];
                    break;
                }
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }

  Stream<int> _randomNum() async* {
    //await Future<void>.delayed(Duration(seconds: 1));
    Random random = new Random();

    while (true) {
      await Future<void>.delayed(Duration(seconds: 1));
      int randomNumber = random.nextInt(1000);
      if (!_streamController.isClosed) {
        yield randomNumber;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    logger.d("disposed");
    _streamController.close();

  }
}
