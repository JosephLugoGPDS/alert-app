import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:alert_app/screens/signin/signin_screen.dart';
import 'package:alert_app/screens/signup/widget/social_icon.dart';
import 'package:alert_app/widgets/alredy_have_an_account_acheck.dart';
import 'package:alert_app/widgets/rounded_button.dart';
import 'package:alert_app/widgets/rounded_input_field.dart';
import 'package:alert_app/widgets/rounded_password_field.dart';
import 'background_signup.dart';
import 'or_divider.dart';

class Body extends StatelessWidget {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> registerUser(String email, String pass, String name, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;

      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      info.photoUrl = phone;

      user.updateProfile(info);

      return true;
    } catch (e) {
      print(e);
      return false;
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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.25,
            ),
            RoundedInputField(
              controller: _nameController,
              hintText: "Nombre",
              onChanged: (value) {
                // _nameController.clear();
              },
            ),
            RoundedInputField(
              controller: _phoneController,
              hintText: "numero de celular",
              onChanged: (value) {
                // _phoneController.clear();
              },
              icon: Icons.phone,
              
            ),
            RoundedInputField(
              controller: _emailController,
              hintText: "example@example.com",
              onChanged: (value) {
                // _emailController.clear();
              },
              icon: Icons.email,
              
            ),
            RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {
                // _passwordController.clear();
              },
            ),
            RoundedButton(
              text: "REGISTRARSE",
              press: () async{
                final name      = _nameController.text.toString().trim();
                print(name);
                final phone     = _phoneController.text.toString().trim();
                print(phone);
                final email     = _emailController.text.toString().trim();
                print(email);
                final pass  = _passwordController.text.toString().trim();
                print(pass);

                bool res = await registerUser(email, pass, name, phone);

                if(res){
                  print('ir a login');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SigninScreen()));
                } else {
                  print('Error');
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SigninScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
