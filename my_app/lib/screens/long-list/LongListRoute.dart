import 'package:flutter/material.dart';

// void main() => runApp(LongListRoute());

class LongListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Example'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Moon'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Moon'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Moon'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Moon'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Moon'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ],
  );
}

// Widget _myListView(BuildContext context) {

//   final titles = ['bike', 'boat', 'bus', 'car',
//   'railway', 'run', 'subway', 'transit', 'walk'];

//   final icons = [Icons.directions_bike, Icons.directions_boat,
//   Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
//   Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
//   Icons.directions_walk];

//   return ListView.builder(
//     itemCount: titles.length,
//     itemBuilder: (context, index) {
//       return Card( //                           <-- Card widget
//         child: ListTile(
//           leading: Icon(icons[index]),
//           title: Text(titles[index]),
//         ),
//       );
//     },
//   );
// }
