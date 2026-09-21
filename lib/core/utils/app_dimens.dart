import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppDimens {
  static final double r4 = 4.r;
  static final double r8 = 8.r;
  static final double r10 = 10.r;
  static final double r12 = 12.r;
  static final double r14 = 14.r;
  static final double r16 = 16.r;
  static final double r20 = 20.r;
  static final double r24 = 24.r;
  static final double r28 = 28.r;
  static final double r32 = 32.r;
  static final double r40 = 40.r;
  static final double r50 = 50.r;

  static final double r32Sp = 32.sp;
  static final double shadowBlurRadius = 16.r;
  static final double defaultPadding = 16.r;

  static final double h4 = 4.h;
  static final double h6 = 6.h;
  static final double h8 = 8.h;
  static final double h10 = 10.h;
  static final double h12 = 12.h;
  static final double h14 = 14.h;
  static final double h16 = 16.h;
  static final double h20 = 20.h;
  static final double h24 = 24.h;
  static final double h32 = 32.h;
  static final double h50 = 55.h;
  static final double h85 = 85.h;
  static final double h100 = 100.h;

  static final double w2 = 2.w;
  static final double w4 = 4.w;
  static final double w6 = 6.w;
  static final double w8 = 8.w;
  static final double w10 = 10.w;
  static final double w12 = 12.w;
  static final double w14 = 14.w;
  static final double w16 = 16.w;
  static final double w18 = 18.w;
  static final double w20 = 20.w;
  static final double w24 = 24.w;
  static final double w28 = 28.w;
  static final double w55 = 55.w;
  static final double w70 = 70.w;
  static final double w90 = 90.w;
  static final double w110 = 110.w;

  static final double sp16 = 17.w;
  static final double sp24 = 24.w;
  static final double sp20 = 20.w;
}

Widget hSpace(double h) {
  return SizedBox(height: h.h);
}

Widget wSpace(double w) {
  return SizedBox(width: w.w);
}
