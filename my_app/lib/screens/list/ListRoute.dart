import 'package:flutter/material.dart';
import '../long-list/index.dart';

// void main() => runApp(MyListRoute());

class MyListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LongListRoute()),
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
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Item 2'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Item 3'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Item 8'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 1'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 4'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 5'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 6'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 9'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 10'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 11'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 12'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 13'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 14'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Item 15'),
            ),
          ],
        ),
      ),
    );
  }
}
