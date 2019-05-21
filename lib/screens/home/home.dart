import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hyped/data/index.dart';
import 'package:hyped/screens/countdown/index.dart';
import 'package:hyped/theme.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List<Trip> trips = [
    Trip(
      date: DateTime(2019, 8, 14),
      image: 'usa.jpg',
      title: "USA Trip Countdown",
    ),
    Trip(
      date: DateTime(2020, 2, 9),
      image: 'usa.jpg',
      title: "Birthday",
    ),
  ];

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hyped'),
        backgroundColor: AppTheme.primaryColor,
        actions: <Widget>[
          IconButton(
            onPressed: add,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: PageView(
        controller: controller,
        children: trips.map((trip) => Countdown(trip: trip)).toList(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  void add() {
    setState(() {
      trips.add(Trip(date: DateTime.now(), image: 'usa.jpg', title: 'New Trip'));
    });
    controller.animateToPage(trips.length - 1, curve: Curves.ease, duration: Duration(milliseconds: 300));
  }
}
