// import 'package:alert_app/screens/home/home_screen.dart';
import 'package:alert_app/screens/map/mapa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'background_signin.dart';
import 'package:alert_app/screens/signup/signup_screen.dart';
import 'package:alert_app/widgets/alredy_have_an_account_acheck.dart';
import 'package:alert_app/widgets/rounded_button.dart';
import 'package:alert_app/widgets/rounded_input_field.dart';
import 'package:alert_app/widgets/rounded_password_field.dart';


class Body extends StatelessWidget {

  // const Body({
  //   Key key,
  // }) : super(key: key);


final _emailController = TextEditingController();
final _passController = TextEditingController();
  
   //auth
  Future<FirebaseUser> login(String email,String pass) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);


      FirebaseUser user = result.user;
      return user;

    } catch (e) {
      print(e);
      return null;
    }

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN IN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "example@example.com",
              onChanged: (value) {},
              controller: _emailController,
              icon: Icons.email,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: _passController,
            ),
            RoundedButton(
              text: "INGRESAR",
              press: () async {
                final email = _emailController.text.toString().trim();
                final pass = _passController.text.toString().trim();

                    FirebaseUser user = await login(email, pass);

                    if(user != null){
                      Navigator.push(context,
                        MaterialPageRoute(
                           // builder: (context)=>HomeScreen(name: user.displayName,imageUrl: user.photoUrl,)));
                          // builder: (context)=>HomeScreen(name: user.displayName)));
                          builder: (context)=>HomeScreenMap()));
                    } else{
                      print('Error');
                    }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


