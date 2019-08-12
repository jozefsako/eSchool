import 'package:eschool_login/pages/sign_in_learner.dart';
import 'package:eschool_login/pages/sign_in_teacher.dart';
import 'package:flutter/material.dart';

double offset = 50.0;

class NewUserType extends StatefulWidget {
  @override
  _NewUserTypeState createState() => _NewUserTypeState();
}

class _NewUserTypeState extends State<NewUserType> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInTeacher()) );
          },
          child:LeftContainer()
          ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInLearner()) );
          },
          child: RightContainer()
          ),
      ],
    );
  }
}

class LeftContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ClipPath(
            clipper: CutContainerLeft(),
            child: Container(
              color: Colors.green[300],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0,left: 18.0),
              child: Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.supervised_user_circle,
                      size: 84.0,
                      color: Colors.white,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text('Become a teacher !',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0,
                      ),),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class RightContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ClipPath(
          clipper: CutContainerRight(),
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 90.0,right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/1.9,
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.drive_eta,
                      color: Colors.green[300],
                      size: 84.0,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text('Become a learner !',
                      style: TextStyle(
                        color: Colors.green[300],
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0,
                      ),),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    ],   
    );
  }
}

class CutContainerLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width - offset, 0);
    path.lineTo(offset, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CutContainerRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width - offset, 0);
    path.lineTo(offset, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}