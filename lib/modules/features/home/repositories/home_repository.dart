import 'package:bts_test/constants/api_consts.dart';
import 'package:bts_test/modules/features/home/models/add_checklist_response_model.dart';
import 'package:bts_test/modules/features/home/models/checklist_response_model.dart';
import 'package:bts_test/modules/features/home/models/delete_checklist_response_model.dart';
import 'package:bts_test/utils/api_services.dart';
import 'package:bts_test/utils/hive_service.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  HomeRepository._();

  static Future<ChecklistResponseModel> getChecklist() async {
    try {
      var token = await HiveServices.getToken();
      final dio = ApiService.dioCall(authorization: token);
      var response = await dio.get(ApiConstants.checklist);

      return ChecklistResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return ChecklistResponseModel(
          errorMessage: e.response?.data['errorMessage']);
    }
  }

  static Future<AddChecklistResponseModel> addChecklist(name) async {
    try {
      var token = await HiveServices.getToken();
      final dio = ApiService.dioCall(authorization: token);
      var response = await dio.post(ApiConstants.checklist, data: {
        'name': name,
      });

      return AddChecklistResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return AddChecklistResponseModel(
          errorMessage: e.response?.data['errorMessage']);
    }
  }

  static Future<DeleteChecklistResponseModel> deleteCheklist(id) async {
    try {
      var token = await HiveServices.getToken();
      final dio = ApiService.dioCall(authorization: token);
      var response = await dio.delete("${ApiConstants.checklist}/$id");

      return DeleteChecklistResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return DeleteChecklistResponseModel(
          errorMessage: e.response?.data['errorMessage']);
    }
  }
}
