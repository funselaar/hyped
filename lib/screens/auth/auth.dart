import 'package:flutter/material.dart';
import 'widgets/google_button/index.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
            child: new GoogleButton(),
          )
      )
    );
  }
}
