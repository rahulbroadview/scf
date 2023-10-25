import 'package:get/get.dart';

import '../controllers/adminfile_controller.dart';

class AdminFilelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminFilelistController>(
      () => AdminFilelistController(),
    );
  }
}
