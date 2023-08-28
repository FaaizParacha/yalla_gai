import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla_gai/utils/contstants.dart';

import '../../utils/routes.dart';
import 'OTP.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16),
          child: Column(
            children: [
              36.height,
              Image.asset('assets/logo.png',color: blackColor,height: 50,),
              36.height,
              Text('Enter Your Mobile Number',style: 25.black500Text,),
              24.height,
              const Padding(
                padding:  EdgeInsets.only(left: 40.0,right: 40),
                child: Divider(
                  thickness: 0.4,
                ),
              ),
              24.height,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: blackColor, width: 0.4),
                          borderRadius: BorderRadius.circular(5)),
                      child:const CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'IT',
                        favorite: ['+39', 'FR'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: true,
                      ),
                    ),
                  ),
                  8.width,
                  Expanded(flex: 3, child: TextFormField())
                ],
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't you have an account? ",style: GoogleFonts.plusJakartaSans(

                  ),),
                  TextButton(onPressed: (){}, child: Text('Click Here',style: GoogleFonts.plusJakartaSans(),))
                ],
              ),
              Spacer(),
              RadioListTile(
                activeColor: appColor,
                title: Text('I agree to Terms and Conditions',style: 16.blackText,),
                value: true,
                groupValue: isSelected,
                onChanged: ( value) {
                  setState(() {
                    isSelected = value!;
                  });
                },
              ),
              12.height,
              Container(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                    foregroundColor: whiteColor,
                    shape: 8.roundedRectangleBorder
                  ),
                  onPressed: isSelected?() {
                    MyRouteBase().myRouteFn(context, OTP());

                  }:null,
                  child: Text('Continue',style: GoogleFonts.plusJakartaSans(),),
                ),
              ),
              12.height,
            ],
          ),
        ),
      ),
    );
  }
}
