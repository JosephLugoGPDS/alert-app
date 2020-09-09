import 'package:alert_app/helpers/constansts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final name;
  // final imageUrl;

  // HomeScreen({this.name,this.imageUrl});
  HomeScreen({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Acceso correcto',style: TextStyle(color: kSecondaryColor, fontSize: 32)),
            SizedBox(height: 16),
            Text('Bienvenido: $name',style: TextStyle(color: kPrimaryColorDark, fontSize: 18)),
            // Text('$imageUrl',style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}