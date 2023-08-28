import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var prefs;
const Color purple = Color(0xff7683E5);
const Color appColor = Color(0xff008000);
const Color whiteColor = Color(0xffffffff);
const Color blackColor = Color(0xff000000);
const Color redColor = Color(0xffff0000);

const Color lightGrey = Color(0xffD9D9D9);
const Color greyBG = Color(0xffF6F6F6);

extension Space on num {
  SizedBox get height => SizedBox(
    height: toDouble(),
  );
  SizedBox get width => SizedBox(
    width: toDouble(),
  );
  RoundedRectangleBorder get roundedRectangleBorder => RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(toDouble())
      );
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  TextStyle get whiteText => GoogleFonts.plusJakartaSans(
    color: whiteColor,
    fontSize: toDouble(),
  );
  TextStyle get blackText => GoogleFonts.plusJakartaSans(
    color: blackColor,
    fontSize: toDouble(),
  );

  TextStyle get white500Text => GoogleFonts.plusJakartaSans(
    color: whiteColor,
    fontWeight: FontWeight.w500,
    fontSize: toDouble(),
  );
  TextStyle get black500Text => GoogleFonts.plusJakartaSans(
    color: blackColor,
    fontWeight: FontWeight.w500,
    fontSize: toDouble(),
  );

  TextStyle get redText => GoogleFonts.plusJakartaSans(
    color: redColor,
    fontSize: toDouble(),
  );

}