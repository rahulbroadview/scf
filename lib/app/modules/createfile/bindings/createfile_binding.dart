import 'package:get/get.dart';

import '../controllers/createfile_controller.dart';

class CreateFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateFileController>(
      () => CreateFileController(),
    );
  }
}
