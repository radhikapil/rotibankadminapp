import 'package:flutter/material.dart';
import 'package:rotibankadminapp/food_donations/food_donations.dart';
import 'package:rotibankadminapp/gallery/gallery.dart';
import 'package:rotibankadminapp/money_donations/money_donations.dart';
import 'package:rotibankadminapp/volunteers/volunteers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RotiBank Admin App',
      theme: ThemeData(primaryColor: Colors.white, fontFamily: 'Poppins'),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cIndex = 0;
  List<String> img = [
    'enabled',
    'disabled',
    'disabled',
    'disabled',
    'disabled'
  ];
  final List<Widget> _children = [
    FoodDonations(),
    MoneyDonations(),
    Volunteers(),
    Gallery()
  ];
  void onTabTapped(int index) {
    setState(() {
      _cIndex = index;
      img[index] = 'enabled';
      for (int i = 0; i < 4; i++) {
        if (i != index) {
          img[i] = 'disabled';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_cIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _cIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/food-' + img[0] + '.png',
              width: 25.0,
              height: 25.0,
            ),
            title: Text(
              'Food Donations',
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF4A90E2),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/donation-' + img[1] + '.png',
              width: 25.0,
              height: 25.0,
            ),
            title: Text(
              'Money Donations',
              style: TextStyle(
                fontSize: 11.0,
                color: Color(0xFF4A90E2),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/volunteer-' + img[2] + '.png',
              width: 25.0,
              height: 25.0,
            ),
            title: Text(
              'Volunteers',
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF4A90E2),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/gallery-' + img[3] + '.png',
              width: 25.0,
              height: 25.0,
            ),
            title: Text(
              'Gallery',
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF4A90E2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
