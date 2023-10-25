import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pay_day_manager/app/modules/customerlisting/views/customerlisting_view.dart';
import 'package:pay_day_manager/app/modules/dashboard/views/dashboard_view.dart';
import 'package:pay_day_manager/app/modules/details/views/details_view.dart';
import '../../../core/them/const_color.dart';
import '../../login/views/login_view.dart';
import '../../myprofile/views/myprofile_view.dart';
import '../../signup/views/signup_view.dart';
import '../../staaflist/views/staaflist_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => (controller.isShowSplash.value)
                ? splashWidget(context)
                : const SignupView(),
          ),
        ],
      ),
    );
  }

  Widget splashWidget(BuildContext context) {
    return Container(
      color: ConstColor.color1E3F84,
      child: Column(
        children: [
          Expanded(
            child: Center(
                child: SvgPicture.asset(
              'assets/assets_svg/splash.svg',
              height: 150.w,
              width: 150.w,
            )),
          ),
        ],
      ),
    );
  }
}
