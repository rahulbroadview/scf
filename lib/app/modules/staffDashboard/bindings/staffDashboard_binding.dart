import 'package:get/get.dart';

import '../controllers/staffDashboard_controller.dart';

class StaffDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffDashboardController>(
      () => StaffDashboardController(),
    );
  }
}
