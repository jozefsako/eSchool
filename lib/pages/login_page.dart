import 'package:flutter/material.dart';
import '../Widgets/FormCard.dart';
import 'sign_in_choose_type.dart';
import 'google_maps.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

// console.log("bonjour");

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width: 2.0,color: Colors.black)
    ),
    child: isSelected ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black
      ),
    ) : Container(),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top : 16.0),
                    child: Image.asset("assets/images/car1.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :10.0,right: 10.0),
                    child: FormCard(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: _radio,
                          child: radioButton(_isSelected),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w200
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width/2,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3CB371).withOpacity(.5),
                                    offset: Offset(5.0,8.0),
                                    blurRadius: 3.0
                                  )
                                ]
                              ),
                              child: Material(
                                color: Colors.green[300],
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => GoogleMapsActivity()));
                                  },
                                  child: Center(
                                   child: Text("LOG IN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing:1.0
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 46.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontaleLine(context),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewUserType())
                          );
                        },
                        child: Text('SIGN IN',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.green
                          ),
                        ),
                      ),
                      horizontaleLine(context),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}

Widget horizontaleLine(BuildContext context) => Padding(
  padding: EdgeInsets.symmetric(horizontal: 15.0),
  child: Container(
    width: MediaQuery.of(context).size.width/5.5,
    height: 1.0,
    color: Colors.black26.withOpacity(.3),
  ),
);
