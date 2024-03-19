import 'package:bts_test/configs/themes/app_text_styles.dart';
import 'package:bts_test/constants/asset_consts.dart';
import 'package:bts_test/constants/dimen_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textAppBar;
  final double height;
  final bool withButton;
  final Function()? onTap;

  const CustomAppBar({
    super.key,
    required this.textAppBar,
    this.height = kToolbarHeight,
    this.withButton = true,
    this.onTap,
  });

  const CustomAppBar.noButton({
    super.key,
    required this.textAppBar,
    this.height = kToolbarHeight,
    this.withButton = false,
    this.onTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (withButton)
          ? IconButton(
              icon: SvgPicture.asset(
                AssetConsts.iconBack,
              ),
              onPressed: onTap ?? () => Get.back(),
            )
          : Container(),
      elevation: 1,
      title: Text(
        textAppBar,
        style: AppTextStyles.f20PrimaryW600,
      ),
      centerTitle: true,
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: DimenConsts.pixel5.h),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
