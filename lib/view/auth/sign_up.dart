import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:yalla_gai/utils/routes.dart';
import 'package:yalla_gai/view/auth/login.dart';


import '../widgets/male_female_selection.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              36.height,

              SizedBox(
                height: 95,
                width: 95,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: blackColor,width: 0.4)
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: -15,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt, color: blackColor,),
                        )),
                  ],
                ),
              ),
              16.height,
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter you First Name',
                  labelStyle: GoogleFonts.plusJakartaSans(
                    color: appColor,
                    fontSize: 12
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:appColor), // Set the focus color here
                  ),
                ),
              ),
              16.height,
              TextFormField(
                decoration: InputDecoration(

                    labelText: 'Enter your Last Name',
                    labelStyle: GoogleFonts.plusJakartaSans(
                        color: appColor,
                        fontSize: 12
                    ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:appColor), // Set the focus color here
                  ),
                ),
              ),
              16.height,
              GenderSelector(),

              16.height,
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter your E-mail',
                    labelStyle: GoogleFonts.plusJakartaSans(
                        color: appColor,fontSize: 12
                    ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:appColor), // Set the focus color here
                  ),
                ),
              ),
              16.height,
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter your Password',
                    labelStyle: GoogleFonts.plusJakartaSans(
                        color: appColor,fontSize: 12
                    ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:appColor), // Set the focus color here
                  ),
                ),

              ),
              16.height,
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Confirm your Password',
                    labelStyle: GoogleFonts.plusJakartaSans(
                        color: appColor,
                        fontSize: 12
                    ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:appColor), // Set the focus color here
                  ),
                ),
              ),

              48.height,
              Container(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                      foregroundColor: whiteColor,
                      shape: 8.roundedRectangleBorder
                  ),
                  onPressed: () {
                   // MyRouteBase().myRouteFn(context, OTP());
                    _showAlertDialog(context);

                  },
                  child: Text('Continue',style: GoogleFonts.plusJakartaSans(),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: 12.roundedRectangleBorder,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/congrats.png'),
              6.height,
              Divider(),
              6.height,
              Text('Congratulations! Your Account Created Successfully',
              style: 16.blackText,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: appColor,
                foregroundColor: whiteColor,
                elevation: 0,
                shape: 8.roundedRectangleBorder
              ),
              onPressed: () {
                Navigator.of(context).pop();
                MyRouteBase().myRouteFn(context, Login());
              },
              child: Text('Okay',style: GoogleFonts.plusJakartaSans(),),
            ),
          ],
        );
      },
    );
  }
}




