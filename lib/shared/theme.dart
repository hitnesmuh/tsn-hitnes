import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 14.0;

Color kPrimaryColor = const Color(0xff2F5091);
Color kBackgroundColor = const Color(0xffFAFAFA);
Color kBlackColor = const Color(0xff1F1449);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kGreyColor = const Color(0xff9698A9);
Color kTransparentColor = Colors.transparent;
Color kAvailableColor = Color(0xffE0D9FF);
Color kUnavailableColor = Color(0xffEBECF1);

TextStyle blueTextstyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);

TextStyle blackTextstyle = GoogleFonts.poppins(
  color: kBlackColor,
);

TextStyle whiteTextstyle = GoogleFonts.poppins(
  color: kWhiteColor,
);

TextStyle greyTextstyle = GoogleFonts.poppins(
  color: kGreyColor,
);

TextStyle transparentTextstyle = GoogleFonts.poppins(
  color: kTransparentColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
