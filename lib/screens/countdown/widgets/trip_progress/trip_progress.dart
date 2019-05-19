import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hyped/data/index.dart';
import 'package:hyped/theme.dart';

class TripProgress extends StatefulWidget {
  final Trip trip;

  TripProgress({this.trip});

  @override
  State<StatefulWidget> createState() {
    return TripProgressState(trip: trip);
  }
}

class TripProgressState extends State<TripProgress> {
  final Trip trip;

  Timer _timer;
  double progress;

  TripProgressState({this.trip}) {
    progress = getProgress();
  }

  @override
  void initState() {
    super.initState();
    _timer = new Timer.periodic(const Duration(seconds: 1), updateProgress);
  }

  void updateProgress(Timer timer) {
    setState(() {
      progress = getProgress();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  double getProgress() {
    final totalSeconds = trip.date.difference(trip.creation).inSeconds;
    final remainSeconds = trip.date.difference(DateTime.now()).inSeconds;
    return 1 - (remainSeconds / totalSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new CustomPaint(
          foregroundPainter: new ProgressPainter(
              completePercent: getProgress() * 100.0,
              width: 4.0),
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new CircleAvatar(
              backgroundImage: ExactAssetImage('assets/images/' + trip.image),
              minRadius: 90,
              maxRadius: 150,
            ),
          ),
        ));
  }
}

class ProgressPainter extends CustomPainter {
  double completePercent;
  double width;

  ProgressPainter(
      {this.completePercent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    if (completePercent < 0.01)
      return;

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    Paint complete = new Paint()
      ..shader = new LinearGradient(colors: [AppTheme.primaryColor, AppTheme.secondaryColor]).createShader(rect)
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}