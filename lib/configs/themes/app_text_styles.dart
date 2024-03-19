import 'package:bts_test/configs/themes/app_colors.dart';
import 'package:bts_test/configs/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  // primary color
  static final TextStyle f10PrimaryW400 = TextStyle(
    fontSize: 10.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.poppins,
  );
  static final TextStyle f14PrimaryW600 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.poppins,
  );
  static final TextStyle f20PrimaryW600 = TextStyle(
    fontSize: 20.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.poppins,
  );

  //Black color
  static final TextStyle f12BlackW500 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.poppins,
  );
  static final TextStyle f14BlackW400 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.poppins,
  );

  //Red color
  static final TextStyle f12RedW400 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.redColor,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.poppins,
  );

  //Grey color
  static final TextStyle f12GreyW400 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.poppins,
  );

  //White color
  static final TextStyle f14WhiteW600 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.poppins,
  );
  static final TextStyle f16WhiteW500 = TextStyle(
    fontSize: 16.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.poppins,
  );
}
