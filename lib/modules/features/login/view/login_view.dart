import 'package:bts_test/configs/routes/app_routes.dart';
import 'package:bts_test/configs/themes/app_colors.dart';
import 'package:bts_test/configs/themes/app_text_styles.dart';
import 'package:bts_test/constants/dimen_consts.dart';
import 'package:bts_test/modules/features/login/controllers/login_controller.dart';
import 'package:bts_test/shared/widgets/custom_app_bar.dart';
import 'package:bts_test/shared/widgets/custom_app_button.dart';
import 'package:bts_test/shared/widgets/custom_app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.to;

    return Scaffold(
      appBar: const CustomAppBar.noButton(textAppBar: 'Login'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: DimenConsts.pixel20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: AppTextStyles.f14BlackW400,
                    ),
                    SizedBox(height: DimenConsts.pixel10.h),
                    CustomAppTextField(
                      controller: controller.usernameController,
                    ),
                    SizedBox(height: DimenConsts.pixel12.h),
                    Text(
                      "Password",
                      style: AppTextStyles.f14BlackW400,
                    ),
                    SizedBox(height: DimenConsts.pixel10.h),
                    CustomAppTextField(
                      controller: controller.passwordController,
                      inputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: DimenConsts.pixel32.h),
                    CustomAppButton(
                      text: 'Login',
                      width: double.infinity,
                      height: DimenConsts.pixel48.h,
                      textStyle: AppTextStyles.f16WhiteW500,
                      color: AppColors.primaryColor,
                      onTap: () {
                        controller.login();
                      },
                    ),
                    SizedBox(height: DimenConsts.pixel24.h),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTextStyles.f14BlackW400,
                          children: [
                            const TextSpan(text: "Don't have an account?"),
                            TextSpan(
                              text: ' Register',
                              style: AppTextStyles.f14PrimaryW600,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(
                                    AppRoutes.registerView,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
