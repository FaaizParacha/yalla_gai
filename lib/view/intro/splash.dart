import 'package:flutter/material.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:yalla_gai/view/intro/intro_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
    _animationController!.forward();
    _animation!.addStatusListener((status)async {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return IntroScreen1();
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
      }
    });

  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
        body: Stack(
          children: [
            Image.asset('assets/splash.png',
              fit: BoxFit.fitWidth,height: double.infinity,
            width: double.infinity,),
            Positioned.fill(
              child: FadeTransition(
                opacity: _animation!,
                child: Center(
                  child: Image.asset('assets/logo.png'),
                ),
              ),
            ),
          ],
        ),
    );
  }
}