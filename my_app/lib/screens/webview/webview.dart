import 'dart:async';
import 'package:flutter/material.dart';

// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  final String title;
  final String selectedUrl;
  // final String title: "Alligator.io",
  // final String selectedUrl: "https://alligator.io",

  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
      
  WebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text(title),
    //     ),
    //     // body: WebView(
    //     //   // key: UniqueKey(),
    //     //   initialUrl: selectedUrl,
    //     //   javascriptMode: JavascriptMode.unrestricted,
    //     //   onWebViewCreated: (WebViewController webViewController) {
    //     //     _controller.complete(webViewController);
    //     //   },
    //     // ));
    return WebviewScaffold(
      url: selectedUrl,
      appBar: AppBar(
        title: Text(title),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
