import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  // const BottomNavigation({ Key key, this.destination }) : super(key: key);

  // final Destination destination;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BottomNavigation> {
  var _selectedIndex = 0;
  void _onItemTapped(int index) {
    // Navigator.pop(context);
    setState(() {
      _selectedIndex = index;
      if(index == 0) {
        Navigator.pushNamed(context, '/cards');
      } else if (index == 1) {
        Navigator.pushNamed(context, '/loans');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/learn');
      } else if (index == 3) {
        Navigator.pushNamed(context, '/learn');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          title: new Text('Cards'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.person),
          title: new Text('Loans'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.book),
          title: new Text('Learn')
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
