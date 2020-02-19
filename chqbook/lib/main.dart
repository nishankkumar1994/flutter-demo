import 'package:flutter/material.dart';
import './theme/style.dart';
import './routes.dart';
// import 'package:example/bloc/bloc-prov-tree.dart';
// import 'package:example/bloc/bloc-prov.dart';
// import 'package:example/blocs/blocs.dart';
// import 'blocs/blocs.dart';

void main() {
  runApp(ExampleApp());
}
class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ExampleApp',
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,
      );
  }
}