import 'package:get/get.dart';

import '../controllers/addSetting_controller.dart';

class AddSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSettingController>(
      () => AddSettingController(),
    );
  }
}
