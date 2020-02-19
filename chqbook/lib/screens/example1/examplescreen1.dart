import 'package:flutter/material.dart';
import './components/body.dart';
import '../../widgets/BottomNavigation/index.dart';
import '../../widgets/DrawerWindow/index.dart';

class ExScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Body(),
      drawer: DrawerWindow(),
      bottomNavigationBar: BottomNavigation()
    );
  }
}

