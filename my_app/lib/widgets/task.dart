import 'package:flutter/material.dart';

import 'appBars.dart';
import 'bottomNavigation.dart';
import 'fab.dart';
import 'util.dart';
import 'transaction.dart';

class Task extends StatefulWidget {
  Task({Key key}) : super(key: key);

  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final bottomNavigationBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                        margin: EdgeInsets.only(left: 10, top: 15, bottom: 0),
                        // child: Text(
                        //   'Projects',
                        //   style: TextStyle(
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.w600,
                        //       color: CustomColors.TextSubHeader),
                        // ),
                      ),
                  childCount: 1),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transaction()),
                    );
                  },
                  child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 65,
                              height: 65,
                              child: Image.asset('assets/images/icon-user.png'),
                              decoration: const BoxDecoration(
                                color: CustomColors.YellowBackground,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Sales',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: CustomColors.TextHeaderGrey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '24 Transactions',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: CustomColors.TextSubHeaderGrey),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.GreyBorder,
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(10),
                      height: 150.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transaction()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-briefcase.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.GreenBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Purchases',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '44 Transactions',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transaction()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-presentation.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.PurpleBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Receipts',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '45 Transactions',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transaction()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-shopping-basket.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.OrangeBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Payments',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '54 Transactions',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transaction()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-confetti.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.BlueBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Collections',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '24 Transactions',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transaction()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-molecule.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.PurpleBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Funds Transfers',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '24 Transactions',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFab(context),
      bottomNavigationBar:
          BottomNavigationBarApp(context, bottomNavigationBarIndex),
    );
  }
}
