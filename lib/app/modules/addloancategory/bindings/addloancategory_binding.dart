import 'package:get/get.dart';

import '../controllers/addloancategory_controller.dart';

class AddLoanCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLoanCategoryController>(
      () => AddLoanCategoryController(),
    );
  }
}
