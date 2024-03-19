import 'package:bts_test/configs/themes/app_colors.dart';
import 'package:bts_test/constants/dimen_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// general loading dialog
/// [How to use]
/// () => DialogHelper.showLoadingDialog(context)

class DialogHelper {
  const DialogHelper._();

  static const opacity0_5 = 0.5;
  static const strokeWidth = 8;

  static Future<void> showLoadingDialog(
    BuildContext context, {
    bool popped = true,
  }) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(opacity0_5),
      pageBuilder: (_, __, ___) {
        return WillPopScope(
          onWillPop: () async => popped,
          child: Center(
            child: Container(
              width: DimenConsts.pixel80.h,
              height: DimenConsts.pixel80.h,
              padding: EdgeInsets.symmetric(
                horizontal: DimenConsts.pixel16.w,
                vertical: DimenConsts.pixel16.h,
              ),
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth.r,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
