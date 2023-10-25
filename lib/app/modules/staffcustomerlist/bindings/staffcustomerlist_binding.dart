import 'package:get/get.dart';

import '../controllers/staffcustomerlist_controller.dart';

class StaffCustomerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffCustomerListController>(
      () => StaffCustomerListController(),
    );
  }
}
