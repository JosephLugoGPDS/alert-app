import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(46,48,48,1.0),
      child: Center(
        child: SpinKitFadingCube(
        color: Color.fromRGBO(73,201,191,1.0),
        size: 50.0,
        ),
      ),
    );
  }
}