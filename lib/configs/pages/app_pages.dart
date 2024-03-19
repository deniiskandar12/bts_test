import 'package:bts_test/configs/routes/app_routes.dart';
import 'package:bts_test/modules/features/home/bindings/home_binding.dart';
import 'package:bts_test/modules/features/home/view/home_view.dart';
import 'package:bts_test/modules/features/login/bindings/login_binding.dart';
import 'package:bts_test/modules/features/login/view/login_view.dart';
import 'package:bts_test/modules/features/register/bindings/register_binding.dart';
import 'package:bts_test/modules/features/register/view/register_view.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages() {
    return [
      GetPage(
        name: AppRoutes.loginView,
        page: () => const LoginView(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: AppRoutes.registerView,
        page: () => const RegisterView(),
        binding: RegisterBinding(),
      ),
      GetPage(
        name: AppRoutes.homeView,
        page: () => const HomeView(),
        binding: HomeBinding(),
      ),
    ];
  }
}
