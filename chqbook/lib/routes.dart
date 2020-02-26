import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './screens/example1/examplescreen1.dart';
import './screens/example2/examplescreen2.dart';
import 'package:easy_web_view/easy_web_view.dart';
import './widgets/BottomNavigation/index.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => ExScreen1(),
  "/loans": (_) => new Scaffold(
      body: EasyWebView(
        src: "https://www.chqbook.com/explore-personal-loans",
      ),
      appBar: new AppBar(
        title: new Text("Chqbook"),
      ),
      bottomNavigationBar: BottomNavigation()
    ),
  "/cards": (_) => new Scaffold(
      body: EasyWebView(
        src: "https://www.chqbook.com/explore-credit-cards",
      ),
      appBar: new AppBar(
        title: new Text("Chqbook"),
      ),
      bottomNavigationBar: BottomNavigation()
    ),
  "/learn": (_) => new Scaffold(
      body: EasyWebView(
        src: "https://blog.chqbook.com/",
      ),
      appBar: new AppBar(
        title: new Text("Chqbook"),
      ),
      bottomNavigationBar: BottomNavigation()
    ),

};
