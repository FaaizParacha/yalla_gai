import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:yalla_gai/view/intro/welcome_screen.dart';

class IntroScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: onBoarding(
          skipTrue: true,
            imageUrl: 'assets/onboarding1.png',
            text: 'Request Ride',
          onTap: () {

            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return IntroScreen2();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );
          },
        ));
  }

}

class IntroScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: onBoarding(
          skipTrue: true,
          imageUrl: 'assets/onboarding2.png',
          text: 'Real Time Tracking',
          onTap: () {

            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return IntroScreen3();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );
          },
        ));
  }

}

class IntroScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: onBoarding(
          skipTrue: false,
          imageUrl: 'assets/onboarding3.png',
          text: 'Reliable Service',
          onTap: () {

            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return WelcomeScreen();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );
          },
        ));
  }

}



class onBoarding extends StatelessWidget {
  final String imageUrl,text;
  final VoidCallback onTap;
  final bool skipTrue;
   onBoarding({super.key,
  required this.imageUrl,required this.text,required this.onTap,required this.skipTrue
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          imageUrl,
          fit: BoxFit.fitWidth,
          height: double.infinity,
          width: double.infinity ,
        ),
        skipTrue==false?Container():Positioned(
            top: 50,
            right: 20,
            child: Container(
              height: 25,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                    backgroundColor: whiteColor.withOpacity(0.33),
                    shape: 12.roundedRectangleBorder),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return WelcomeScreen();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                            position: offsetAnimation, child: child);
                      },
                    ),
                  );
                },
                child: Text(
                  'Skip',
                  style: 12.whiteText,
                ),
              ),
            )),
        Positioned(
          bottom: 40,
          left: 20,
          child: Container(
            width: MediaQuery.sizeOf(context).width/2.5,
            child: Text(
              text,maxLines:2,
              style: GoogleFonts.urbanist(
                  fontSize: 35, color: whiteColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 20,
          child: GestureDetector(
            onTap: onTap,
            child:const CircleAvatar(
                radius: 25,
                backgroundColor: whiteColor,
                child: Icon(
                  Icons.arrow_forward,
                  color: blackColor,
                )),
          ),
        ),
      ],
    );
  }
}


