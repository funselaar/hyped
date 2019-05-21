import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hyped/data/index.dart';
import 'package:hyped/screens/countdown/widgets/trip_progress/index.dart';
import 'package:hyped/screens/countdown/widgets/trip_time/index.dart';
import 'package:hyped/theme.dart';
import 'package:hyped/widgets/app_button/index.dart';
import 'package:image_picker/image_picker.dart';

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

  TextEditingController titleController;

  CountdownState({this.trip}) {
    titleController = TextEditingController(text: trip.title);
    titleController.addListener(titleChanged);
  }

  void titleChanged() {
    trip.title = titleController.text;
  }

  @override
  Widget build(BuildContext context) {
    if (editMode) {
      return buildEditMode(context);
    } else {
      return buildNormalMode(context);
    }
  }

  String _getDate() {
    return "${trip.date.year.toString()}-${trip.date.month.toString().padLeft(2,'0')}-${trip.date.day.toString().padLeft(2,'0')}";
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
                child: TextField(
                  cursorColor: AppTheme.primaryColor,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  style: AppTheme.titleTextStyle,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: AppTheme.titleEditTextStyle),
                ),
              ),
              Container(
                width: 220,
                height: 220,
                child: GestureDetector(
                    onTap: _selectImage,
                    child: CircleAvatar(
                      backgroundImage: FileImage(File(trip.image)),
                      minRadius: 90,
                      maxRadius: 150,
                    )),
              ),
              Container(
                child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Text("${_getDate()}", style: AppTheme.textStyle.copyWith(fontSize: 20), textAlign: TextAlign.center,),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

  File galleryFile;

  void _selectImage() async {
    galleryFile = await ImagePicker.pickImage(source: ImageSource.camera);
    if (galleryFile == null)
      return;
    setState(() {
      trip.image = galleryFile.path;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: trip.date,
        firstDate: DateTime.now().add(Duration(days: 1)),
        lastDate: DateTime(2100));
    if (picked != null && picked != trip.date)
      setState(() {
        trip.date = picked;
      });
  }

  void toggleEditMode() {
    setState(() {
      this.editMode = !this.editMode;
    });
  }
}
