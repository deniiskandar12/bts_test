import 'package:bts_test/configs/themes/app_colors.dart';
import 'package:bts_test/configs/themes/app_text_styles.dart';
import 'package:bts_test/constants/dimen_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// default app button
/// dont forget add onTap function when
/// you call this widget

class CustomAppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final Color color;
  final Function()? onTap;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Widget? widget;

  const CustomAppButton({
    Key? key,
    this.text,
    this.width,
    this.height,
    this.onTap,
    this.color = AppColors.primaryColor,
    this.borderRadius,
    this.textStyle,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        disabledForegroundColor: color,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(vertical: DimenConsts.pixel6.h),
        minimumSize: Size(
          width ?? double.infinity,
          height ?? DimenConsts.pixel35.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? DimenConsts.pixel8.r,
          ),
          side: BorderSide(color: color),
        ),
      ),
      onPressed: onTap,
      child: widget ??
          Text(
            text ?? 'Button',
            style: textStyle ?? AppTextStyles.f14WhiteW600,
          ),
    );
  }
}
