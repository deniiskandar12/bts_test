import 'package:bts_test/configs/routes/app_routes.dart';
import 'package:bts_test/constants/dimen_consts.dart';
import 'package:bts_test/modules/features/login/models/login_response_model.dart';
import 'package:bts_test/modules/features/login/repositories/login_repository.dart';
import 'package:bts_test/shared/customs/dialog_helper.dart';
import 'package:bts_test/utils/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    DialogHelper.showLoadingDialog(Get.context!);

    LoginResponseModel response = await LoginRepository.login(
      usernameController.text,
      passwordController.text,
    );

    hideLoading();

    if (response.errorMessage == null) {
      try {
        await HiveServices.setToken(response.data?.token ?? "");
        Get.offAllNamed(AppRoutes.homeView);
      } catch (e) {
        Get.showSnackbar(
          GetSnackBar(
            message: e.toString(),
            duration: DimenConsts.int2.seconds,
          ),
        );
      }
    } else {
      Get.showSnackbar(
        GetSnackBar(
          message: response.errorMessage,
          duration: DimenConsts.int2.seconds,
        ),
      );
    }
  }
}

void hideLoading() {
  Get.back();
}
