import 'package:get/get.dart';

import '../controllers/addloanfiles_controller.dart';

class AddLoanFilesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLoanFilesController>(
      () => AddLoanFilesController(),
    );
  }
}
