import 'package:flutter/material.dart';


import 'package:alert_app/helpers/constansts.dart';
import 'package:alert_app/screens/signin/signin_screen.dart';
import 'package:alert_app/screens/signup/signup_screen.dart';
import 'package:alert_app/widgets/rounded_button.dart';
import 'package:alert_app/screens/welcome/widget/background_welcome.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //This size provide us total heigth and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "#ESTOY A TU LADO",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: kPrimaryColorDark
                ),
            ),
            Image.asset(
              "assets/images/logo_full.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "INGRESAR",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SigninScreen();
                }));
              },
            ),
            RoundedButton(
              text: "REGISTRARSE",
              color: kSecondaryColor,
              textColor: kPrimaryColor,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
              },));
              }
            ),
          ],
        ),
      ),
    );
  }
}
