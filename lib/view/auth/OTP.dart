import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:yalla_gai/utils/routes.dart';
import 'package:yalla_gai/view/select_type.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = appColor
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width - size.height / 2, size.height / 2)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - size.height / 2, -size.height / 2)
      ..lineTo(0, -size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




class OTP extends StatelessWidget {
  const OTP({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body:  SafeArea(
          child: FractionallySizedBox(widthFactor: 1, child: OTPcode())),
    );
  }
}

class OTPcode extends StatefulWidget {

  const OTPcode({Key? key}) : super(key: key);

  @override
  State<OTPcode> createState() => _OTPcodeState();
}

class _OTPcodeState extends State<OTPcode> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          36.height,
          CustomPaint(
            painter: ArrowPainter(),
            child: Container(
              width: 240,
              height: 60,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Enter OTP',style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: whiteColor
                )),
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Type in the 6-digit code sent to the number',style: 18.black500Text,),
          ),

          20.height,
          Center(
            child: Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: pinController,
                focusNode: focusNode,
                keyboardType: TextInputType.number,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                validator: (value) {
                  return value == '1234' ? null : 'Pin is incorrect';
                },

                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {

                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
          ),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't you recieve the OTP? ",style: GoogleFonts.plusJakartaSans(

              ),),
              TextButton(onPressed: (){}, child: Text('Resend OTP',style: GoogleFonts.plusJakartaSans(
                color: redColor
              ),))
            ],
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                   ),
                onPressed: () {
                  MyRouteBase().myRouteFn(context, SelectType());
                },
                child: Text(
                  'Verify',
                  style: GoogleFonts.plusJakartaSans(color: whiteColor),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

