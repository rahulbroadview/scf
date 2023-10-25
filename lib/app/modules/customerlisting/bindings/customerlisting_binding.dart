import 'package:get/get.dart';

import '../controllers/customerlisting_controller.dart';

class CustomerlistingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerlistingController>(
      () => CustomerlistingController(),
    );
  }
}
