import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (page){
              print(page+": started");
            },
            onPageFinished: (page){
              print(page+": finished");
              setState(() {
                isLoading = false;
              });
            },
            onWebResourceError: (error){
              setState(() {
                isLoading = false;
              });
            },
            onWebViewCreated: (controller){
              print("webview created");
            },
            initialUrl: 'https://flutter.dev',
          ),
          isLoading ? Center( child: CircularProgressIndicator()) : Container(),
        ],
      ),

    );
  }
}
