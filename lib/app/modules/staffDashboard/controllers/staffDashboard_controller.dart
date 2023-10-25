import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/config/url_utils.dart';
import 'package:pay_day_manager/app/data/services/api_services.dart';
import 'package:pay_day_manager/app/modules/signup/views/signup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/file_model.dart';
import '../../../../models/stafflist_model.dart';
import '../../login/views/login_view.dart';

class StaffDashboardController extends GetxController {
  List<FileList> fileList = [];
  bool refreshList = false;
  bool isLoder = false;
  List<CustomPopupMenuController> popupContoller = [];
  List<StaffList> staffList = [];
  StaffList? selectedStaffLit;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    versionList();
  }

  versionList() async {
    isLoder = true;
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String id = prefs.getString('id') ?? '';
    Map data = {
      "token": token,
      "login_id": id,
      "version": "1.0",
    };
    var finalData =
        await APIServices.postWithDioForlogin(UrlUtils.checkVersion, data);
    if (finalData != null) {
      print("---finalData---$finalData");
      isLoder = false;
    } else {
      isLoder = false;
    }
    update();
  }

  logoutFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(const SignupView());
  }
}
