import 'package:bts_test/constants/hive_const.dart';
import 'package:hive/hive.dart';

class HiveServices {
  HiveServices._();

  // String boxName;
  static final authBox = Hive.box(HiveConstant.authBox);

  static Future<void> setToken(String token) async {
    await authBox.put(HiveConstant.token, token);
  }

  static Future<String> getToken() async {
    var data = authBox.get(HiveConstant.token) ?? "";
    return data;
  }

}