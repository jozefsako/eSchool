import 'package:eschool_login/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  String _username, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.25,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0)
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  letterSpacing: .6),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Username",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w200,
                  fontSize: 16.0),
            ),
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please do not leave username field empty';
                }
              },
              onSaved: (input) => _username = input,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Password",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w200,
                  fontSize: 16.0),
            ),
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please do not leave password field empty';
                }
              },
              onSaved: (input) => _password = input,
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w200,
                    fontSize: 14.0,
                  ),
                  overflow: TextOverflow.fade,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _username, password: _password)) as FirebaseUser;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
