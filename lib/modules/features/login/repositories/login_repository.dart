import 'package:bts_test/constants/api_consts.dart';
import 'package:bts_test/modules/features/login/models/login_response_model.dart';
import 'package:bts_test/utils/api_services.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  LoginRepository._();

  static final Dio _dio = ApiService.dioCall();

  static Future<LoginResponseModel> login(
    String username,
    String password,
  ) async {
    try {
      var response = await _dio.post(ApiConstants.login, data: {
        'username': username,
        'password': password,
      });

      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return LoginResponseModel(errorMessage: e.response?.data['errorMessage']);
    }
  }
}
