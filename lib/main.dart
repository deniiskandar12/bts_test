import 'package:bts_test/configs/pages/app_pages.dart';
import 'package:bts_test/configs/routes/app_routes.dart';
import 'package:bts_test/configs/themes/app_theme.dart';
import 'package:bts_test/constants/hive_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  await Hive.openBox(HiveConstant.authBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'BTS Test',
        debugShowCheckedModeBanner: false,
        locale: const Locale('id'),
        theme: AppTheme.theme,
        getPages: AppPages.pages(),
        initialRoute: AppRoutes.loginView,
      ),
    );
  }
}
