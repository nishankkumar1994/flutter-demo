// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import '../dashboard/index.dart';
import '../list/index.dart';
import '../login/index.dart';
import '../history/index.dart';

// void main() => runApp(Dashboard());

class Dashboard extends StatefulWidget {
  final appTitle = 'Drawer Demo';
  MyHomePage createState()=> MyHomePage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.purple[800],
        accentColor: Colors.amber,
        accentColorBrightness: Brightness.dark
      ),
      // home: Widget(MyHomePage(title: 'Flutter Demo Home Page')),
      // theme: ThemeData(
      //   brightness:     Brightness.light,
      //   primaryColor:   Colors.redAccent,
      //   accentColor:    Colors.redAccent,
      // ),
      // home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends State<Dashboard> {
  // final String title;

  // MyHomePage({Key key, this.title}) : super(key: key);
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer Demo')),
      body: Center(child: RaisedButton(
            child: Text('Dashboard Page'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyListRoute()),
              );
            },
          )),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header', style: TextStyle(color: Colors.white.withOpacity(0.8)),),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => History()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Login'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history,color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('Helo')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album,color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('Pro')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('Mail')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm,color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('Host')
          )
        ],
        onTap: (index){
            _incrementTab(index);
        },
      ) 
    );
  }
}
