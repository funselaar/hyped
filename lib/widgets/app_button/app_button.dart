import 'package:flutter/material.dart';

import '../../theme.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonName;
  final Gradient gradient;
  final double width;
  final double height;

  AppButton({
    this.buttonName,
    this.onPressed,
    this.gradient,
    this.width = 180.0,
    this.height = 40.0,
  });

  @override
  State<StatefulWidget> createState() {
    return AppButtonState(
        buttonName: buttonName,
        gradient: gradient,
        height: height,
        onPressed: onPressed,
        width: width);
  }
}

class AppButtonState extends State<AppButton> {
  final VoidCallback onPressed;
  final String buttonName;
  final Gradient gradient;
  final double width;
  final double height;
  bool pressAttention = false;

  AppButtonState({
    this.buttonName,
    this.onPressed,
    this.gradient,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTapDown: (x) => _onPressed(),
        onTapUp: (x) => _onPressed(),
        onTapCancel: _onPressed,
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: gradient,
            boxShadow: pressAttention
                ? null
                : [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(0.0, 0.0),
                      blurRadius: 2,
                    )
                  ],
          ),
          child: Center(
              child: Text(
            buttonName.toUpperCase(),
            style: AppTheme.buttonTextStyle,
          )),
        ));
  }

  void _onPressed() {
    setState(() => pressAttention = !pressAttention);
  }
}
