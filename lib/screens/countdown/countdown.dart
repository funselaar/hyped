import 'package:flutter/material.dart';
import 'package:hyped/data/index.dart';
import 'package:hyped/screens/countdown/widgets/trip_progress/index.dart';
import 'package:hyped/screens/countdown/widgets/trip_time/index.dart';
import 'package:hyped/theme.dart';
import 'package:hyped/widgets/app_button/index.dart';

class Countdown extends StatefulWidget {
  final Trip trip;

  Countdown({this.trip});

  @override
  State<StatefulWidget> createState() {
    return CountdownState(trip: trip);
  }
}

class CountdownState extends State<Countdown> {
  final Trip trip;

  bool editMode = false;

  CountdownState({this.trip});

  @override
  Widget build(BuildContext context) {
    if (editMode) {
      return buildEditMode(context);
    } else {
      return buildNormalMode(context);
    }
  }

  Widget buildEditMode(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                width: 220,
                child: Text(
                  trip.title,
                  style: AppTheme.titleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: AppButton(
                  buttonName: "Done",
                  gradient: LinearGradient(
                      colors: [AppTheme.primaryColor, AppTheme.secondaryColor]),
                  onPressed: toggleEditMode,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ]),
    );
  }

  Widget buildNormalMode(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  width: 220,
                  child: Text(
                    trip.title,
                    style: AppTheme.titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 240.0,
                  height: 240.0,
                  child: TripProgress(trip: trip),
                ),
                Container(
                  width: 240.0,
                  child: TripTime(trip: trip),
                ),
                Container(
                  child: AppButton(
                    buttonName: "Edit",
                    gradient: LinearGradient(colors: [
                      AppTheme.primaryColor,
                      AppTheme.secondaryColor
                    ]),
                    onPressed: toggleEditMode,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
        ],
      ),
    );
  }

  void toggleEditMode() {
    setState(() {
      this.editMode = !this.editMode;
    });
  }
}
