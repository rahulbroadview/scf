import 'package:get/get.dart';

import '../controllers/filelisting_controller.dart';

class FilelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilelistController>(
      () => FilelistController(),
    );
  }
}
