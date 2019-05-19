import 'package:flutter/material.dart';
import 'package:hyped/widgets/app_button/index.dart';


class FacebookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AppButton(
      buttonName: "facebook",
      gradient: LinearGradient(colors: [Colors.blue[500], Colors.blue[700]]),
    );
  }
}