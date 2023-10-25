import 'package:get/get.dart';

import '../controllers/staaflist_controller.dart';

class StaaflistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaaflistController>(
      () => StaaflistController(),
    );
  }
}
