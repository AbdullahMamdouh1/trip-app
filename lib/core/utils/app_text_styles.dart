import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  //    1 bold
  static TextStyle bold18 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    fontFamily: "Inter",
  );
  static TextStyle bold28 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28.sp,
    fontFamily: "Inter",
  );
  static TextStyle bold24 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    fontFamily: "Inter",
  );

  // 2 semiBold
  static TextStyle semiBold15 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
    fontFamily: "Inter",
  );
  static TextStyle semiBold20 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    fontFamily: "Inter",
  );

  // 3 regular
  static TextStyle regular15 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 15.sp,
    fontFamily: "Inter",
  );

  static TextStyle regular12 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
    fontFamily: "Inter",
  );

  //  4 medium
  static TextStyle medium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    fontFamily: "Inter",
  );
}
