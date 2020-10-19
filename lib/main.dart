import 'package:counter_app/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        secondaryHeaderColor: Colors.deepPurple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter >= 1) {
        _counter--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("init state");
  }



  @override
  Widget build(BuildContext context) {
    print("build method");

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // click notification icon
              },
            ),
          )
        ],
      ),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have pushed the button this many times:',
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(
                            '$_counter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image(
                        width: 150,
                        height: 150,
                        image: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: _incrementCounter,
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /*body: Stack(
        fit: StackFit.expand,

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
         children: [
*/ /*           Center(
             child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Text(
                   'You have pushed the button this many times:',
                 ),
                 Text(
                   '$_counter',
                   style: Theme.of(context).textTheme.headline4,
                 ),

               ],
             ),
           ),*/ /*
          Align(
            alignment: Alignment.center,
            child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
           Positioned(

             right: 10,
             bottom: 10,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                    FloatingActionButton(
                     onPressed: _incrementCounter,
                     tooltip: 'Increment',
                     child: Icon(Icons.add),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   FloatingActionButton(
                     onPressed: _decrementCounter,
                     tooltip: 'Decrement',
                     child: Icon(Icons.remove),
                   ),
                 ],
               ),
             ),
           )
         ],

      ),*/

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("did change dependencies");
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("did update widget");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }



}
