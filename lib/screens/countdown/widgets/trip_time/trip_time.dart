import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hyped/data/index.dart';
import 'package:hyped/theme.dart';

class TripTime extends StatefulWidget {
  final Trip trip;

  TripTime({this.trip});

  @override
  State<StatefulWidget> createState() {
    return TripTimeState(trip: trip);
  }
}

class TripTimeState extends State<TripTime> {
  final Trip trip;

  Timer _timer;
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  TripTimeState({this.trip}) {
    days = getDays();
    hours = getHours();
    minutes = getMinutes();
    seconds = getSeconds();
  }

  @override
  void initState() {
    super.initState();
    _timer = new Timer.periodic(const Duration(seconds: 1), updateTime);
  }

  void updateTime(Timer timer) {
    setState(() {
      days = getDays();
      hours = getHours();
      minutes = getMinutes();
      seconds = getSeconds();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int getDays() {
    return trip.date.difference(DateTime.now()).inDays;
  }

  int getHours() {
    return trip.date.difference(DateTime.now()).inHours - (trip.date.difference(DateTime.now()).inDays * 24);
  }

  int getMinutes() {
    return trip.date.difference(DateTime.now()).inMinutes - (trip.date.difference(DateTime.now()).inHours * 60);
  }

  int getSeconds() {
    return trip.date.difference(DateTime.now()).inSeconds - (trip.date.difference(DateTime.now()).inMinutes * 60);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                days.toString(),
                style: AppTheme.bigTripTimeTextStyle,
              ),
              Text(
                "days",
                style: AppTheme.smallTripTimeTextStyle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(":", style: AppTheme.bigTripTimeTextStyle),
              Text(
                "",
                style: AppTheme.smallTripTimeTextStyle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                hours.toString(),
                style: AppTheme.bigTripTimeTextStyle,
              ),
              Text(
                "hours",
                style: AppTheme.smallTripTimeTextStyle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                ":",
                style: AppTheme.bigTripTimeTextStyle,
              ),
              Text(
                "",
                style: AppTheme.smallTripTimeTextStyle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                minutes.toString(),
                style: AppTheme.bigTripTimeTextStyle,
              ),
              Text(
                "minutes",
                style: AppTheme.smallTripTimeTextStyle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                ":",
                style: AppTheme.bigTripTimeTextStyle,
              ),
              Text(
                "",
                style: AppTheme.smallTripTimeTextStyle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                seconds.toString(),
                style: AppTheme.bigTripTimeTextStyle,
              ),
              Text(
                "seconds",
                style: AppTheme.smallTripTimeTextStyle,
              )
            ],
          )
        ],
      ),
    ]);
  }
}
