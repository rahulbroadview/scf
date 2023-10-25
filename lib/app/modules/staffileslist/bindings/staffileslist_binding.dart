import 'package:get/get.dart';

import '../controllers/staaflist_controller.dart';

class StaffCustomerList extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffFileListController>(
      () => StaffFileListController(),
    );
  }
}
