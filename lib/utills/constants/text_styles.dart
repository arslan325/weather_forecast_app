import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles{
  static TextStyle kDisplayLarge = GoogleFonts.poppins(
    fontSize: 35.sp,
    fontWeight: FontWeight.w700,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kDisplayMedium = GoogleFonts.poppins(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kHeadingMedium = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kHeadingSmall = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kLabelLarge = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kBodyLarge = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorsConstant.onPrimaryWhiteColor,
  );
}