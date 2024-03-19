import 'package:bts_test/constants/dimen_consts.dart';
import 'package:bts_test/modules/features/register/models/register_response_model.dart';
import 'package:bts_test/modules/features/register/repositories/register_repository.dart';
import 'package:bts_test/shared/customs/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {
    DialogHelper.showLoadingDialog(Get.context!);

    RegisterResponseModel response = await RegisterRepository.register(
      emailController.text,
      usernameController.text,
      passwordController.text,
    );

    hideLoading();

    if (response.errorMessage == null) {
      try {
        Get.showSnackbar(
          GetSnackBar(
            message: "Register success",
            duration: DimenConsts.int2.seconds,
          ),
        );
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
