import 'package:bts_test/constants/dimen_consts.dart';
import 'package:bts_test/modules/features/home/models/add_checklist_response_model.dart';
import 'package:bts_test/modules/features/home/models/checklist_response_model.dart';
import 'package:bts_test/modules/features/home/models/delete_checklist_response_model.dart';
import 'package:bts_test/modules/features/home/repositories/home_repository.dart';
import 'package:bts_test/shared/customs/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final checklists = RxList<Checklist>.empty();

  final checklistController = TextEditingController();

  @override
  void onInit() {
    getChecklists();
    super.onInit();
  }

  Future<void> getChecklists() async {
    ChecklistResponseModel response = await HomeRepository.getChecklist();

    if (response.errorMessage == null) {
      checklists.value = response.data!;
    }
  }

  Future<void> addChecklist() async {
    if (checklistController.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          message: "Input cannot be empty",
          duration: DimenConsts.int2.seconds,
        ),
      );
    }
    DialogHelper.showLoadingDialog(Get.context!);

    AddChecklistResponseModel response =
        await HomeRepository.addChecklist(checklistController.text);

    Get.back();

    if (response.errorMessage == null) {
      try {
        Get.showSnackbar(
          GetSnackBar(
            message: response.message,
            duration: DimenConsts.int2.seconds,
          ),
        );
        getChecklists();
        checklistController.clear();
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

  Future<void> deleteChecklist(id) async {
    HomeRepository.deleteCheklist(id);
  }
}
