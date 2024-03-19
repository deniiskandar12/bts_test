import 'package:bts_test/configs/themes/app_colors.dart';
import 'package:bts_test/configs/themes/app_text_styles.dart';
import 'package:bts_test/constants/dimen_consts.dart';
import 'package:bts_test/modules/features/home/controllers/home_controller.dart';
import 'package:bts_test/shared/widgets/custom_app_bar.dart';
import 'package:bts_test/shared/widgets/custom_app_button.dart';
import 'package:bts_test/shared/widgets/custom_app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;

    return Scaffold(
      appBar: const CustomAppBar.noButton(textAppBar: "Checklist App"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DimenConsts.pixel12.w,
          vertical: DimenConsts.pixel16.h,
        ),
        child: Column(
          children: [
            CustomAppTextField(controller: controller.checklistController),
            SizedBox(height: DimenConsts.pixel12.h),
            Row(
              children: [
                Expanded(
                  child: CustomAppButton(
                    text: 'Add',
                    width: double.infinity,
                    height: DimenConsts.pixel48.h,
                    textStyle: AppTextStyles.f16WhiteW500,
                    color: AppColors.primaryColor,
                    onTap: () {
                      controller.addChecklist();
                    },
                  ),
                ),
                SizedBox(width: DimenConsts.pixel8.w),
                Expanded(
                  child: CustomAppButton(
                    text: 'Refresh',
                    width: double.infinity,
                    height: DimenConsts.pixel48.h,
                    textStyle: AppTextStyles.f16WhiteW500,
                    color: AppColors.secondaryColor,
                    onTap: () {
                      controller.getChecklists();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: DimenConsts.pixel12.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.checklists.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final checklist = controller.checklists[index];
                    return Dismissible(
                      onDismissed: (direction) {
                        controller.deleteChecklist(checklist.id);
                        controller.checklists.removeAt(index);
                      },
                      key: Key(checklist.id.toString()),
                      child: CheckboxListTile(
                        value: checklist.checklistCompletionStatus,
                        title: Text(checklist.name.toString()),
                        onChanged: (value) {
                          checklist.checklistCompletionStatus = value;
                          controller.checklists.refresh();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
