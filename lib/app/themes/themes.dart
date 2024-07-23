import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const red = Color(0xFFEA4646);
  static const orange = Color(0xFFFFB100);
  static const green = Color(0xFF008631);
  static const blue = Color(0xFF14279B);
  static const purple = Color(0xFFA207D8);
  static const black = Color(0xFF121212);
  static const ashGrey = Color(0xFF858E96);
  static const grey = Color(0xFFF1F1F1);
  static const white = Color(0xFFF5F6F8);
}

class AppPalette {
  static const MaterialColor green = MaterialColor(
    0xFF008631,
    <int, Color>{
      50: Color(0xFF008631),
      100: Color(0xFF007D2E),
      200: Color(0xFF017223),
      300: Color(0xFF006415),
      400: Color(0xFF005506),
      500: Color(0xFF004800),
      600: Color(0xFF003B00),
      700: Color(0xFF003100),
      800: Color(0xFF001F00),
      900: Color(0xFF001500),
    },
  );
}

TextStyle heading1 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: bold,
  fontSize: 54,
);

TextStyle heading2 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: semibold,
  fontSize: 42,
);

TextStyle heading3 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: medium,
  fontSize: 34,
);

TextStyle heading4 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: regular,
  fontSize: 28,
);

TextStyle heading5 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: light,
  fontSize: 20,
);

TextStyle body1 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: bold,
  fontSize: 16,
);

TextStyle body2 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: bold,
  fontSize: 14,
);

TextStyle paragraph1 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: semibold,
  fontSize: 16,
);

TextStyle paragraph2 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: medium,
  fontSize: 14,
);

TextStyle paragraph3 = GoogleFonts.poppins(
  color: AppColor.black,
  fontWeight: regular,
  fontSize: 12,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
