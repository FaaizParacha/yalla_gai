import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:yalla_gai/utils/routes.dart';
import 'package:yalla_gai/view/auth/login.dart';
import 'package:yalla_gai/view/auth/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              right: -100,
              top: MediaQuery.of(context).size.height / 5,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appColor.withOpacity(0.2),
                ),
              ),
            ),

            Positioned(
              bottom: -80,
              left: -90,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(

                  shape: BoxShape.circle,
                  color: appColor.withOpacity(0.2),
                ),
              ),
            ),
            Column(
              children: [
                36.height,

                Image.asset('assets/logo.png',color: blackColor,height: 50,),
                24.height,
                Image.asset('assets/welcome.png'),
                24.height,
                Text('Welcome to Yalla Gai!',style: 25.black500Text,),
                24.height,
                const Padding(
                  padding:  EdgeInsets.only(left: 40.0,right: 40),
                  child: Divider(
                    thickness: 0.4,
                  ),
                ),
                24.height,
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/4,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: appColor,
                          elevation: 0,
                          shape: 14.roundedRectangleBorder
                      ),
                      onPressed: (){
                        MyRouteBase().myRouteFn(context, Login());
                      },
                      child: Text('Login',style: 14.whiteText,)),
                ),
                24.height,
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/4,
                  height: 45,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: whiteColor,
                          elevation: 0,
                          shape: 14.roundedRectangleBorder
                      ),
                      onPressed: (){
                        MyRouteBase().myRouteFn(context, SignUp());
                      },
                      child: Text('Sign-up',style: 14.blackText,)),
                ),
                70.height,
                RotationTransition(
                  turns:  AlwaysStoppedAnimation(0.50),
                  child: CustomPaint(
                      size: Size(20, 20),
                      painter: DrawTriangleShape()
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: MediaQuery.sizeOf(context).height/2.2,
              right: 50,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:Color(0xff81D1FF),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height/3,
              left: 50,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:Color(0xffFF9898),
                ),
              ),
            ),

          ],
        )
      ),
    );
  }
}




class DrawTriangleShape extends CustomPainter {

  Paint? painter;

  DrawTriangleShape({this.painter}) {

    painter = Paint()
      ..color = Color(0xffFF7A00).withOpacity(0.22)
      ..style = PaintingStyle.fill;

  }

  @override
  void paint(Canvas canvas, Size size) {

    var path = Path();

    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter!);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




