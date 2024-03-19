import 'package:bts_test/constants/api_consts.dart';
import 'package:bts_test/modules/features/register/models/register_response_model.dart';
import 'package:bts_test/utils/api_services.dart';
import 'package:dio/dio.dart';

class RegisterRepository {
  RegisterRepository._();

  static final Dio _dio = ApiService.dioCall();

  static Future<RegisterResponseModel> register(
    String email,
    String username,
    String password,
  ) async {
    try {
      var response = await _dio.post(ApiConstants.register, data: {
        'email': email,
        'username': username,
        'password': password,
      });

      return RegisterResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return RegisterResponseModel(errorMessage: e.response?.data['errorMessage']);
    }
  }
}
