import 'package:get/get.dart';

import '../modules/addcustomer/bindings/addcustomer_binding.dart';
import '../modules/addcustomer/views/addcustomer_view.dart';
import '../modules/addstaff/bindings/addstaff_binding.dart';
import '../modules/addstaff/views/addstaff_view.dart';
import '../modules/customerlisting/bindings/customerlisting_binding.dart';
import '../modules/customerlisting/views/customerlisting_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/myprofile/bindings/myprofile_binding.dart';
import '../modules/myprofile/views/myprofile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/staaflist/bindings/staaflist_binding.dart';
import '../modules/staaflist/views/staaflist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERLISTING,
      page: () => const CustomerlistingView(),
      binding: CustomerlistingBinding(),
    ),
    GetPage(
      name: _Paths.ADDCUSTOMER,
      page: () => const AddcustomerView(),
      binding: AddcustomerBinding(),
    ),
    GetPage(
      name: _Paths.STAAFLIST,
      page: () => const StaaflistView(),
      binding: StaaflistBinding(),
    ),
    GetPage(
      name: _Paths.ADDSTAFF,
      page: () => const AddstaffView(),
      binding: AddstaffBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.MYPROFILE,
      page: () => const MyprofileView(),
      binding: MyprofileBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
