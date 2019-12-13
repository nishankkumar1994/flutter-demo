import 'dart:convert';
import 'Users.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'bottomSheet.dart';

// void main() => runApp(Transaction());

class Transaction extends StatelessWidget {
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

class BodyLayout extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
  // Widget build(BuildContext context) {
  //   return _myListView(context);
  // }
}
class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    Modal modal = Modal();
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Transaction List"),
        //   leading: new IconButton(
        //     icon: new Icon(Icons.arrow_back, color: Colors.white),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
        // ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      // align the text to the left instead of centered
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("${users[index].id} - ${users[index].customer}", style: TextStyle(fontSize: 16),),
                        // Text(users[index].customer, style: TextStyle(fontSize: 16),),
                        Text(users[index].phone, style: TextStyle(fontSize: 10),),
                        Text(users[index].type, style: TextStyle(fontSize: 10),),
                        Text(users[index].status, style: TextStyle(fontSize: 10, color: Colors.green),),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            modal.createTransactionForm(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}
