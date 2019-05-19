import 'package:flutter/material.dart';
import 'package:hyped/widgets/app_button/index.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AppButton(
      buttonName: "Google",
      gradient: LinearGradient(colors: [Colors.red, Colors.red[700]]),
    );
  }
}