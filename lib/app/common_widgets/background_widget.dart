import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/asset_constant.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget body;

  const BackgroundWidget({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ConstAsset.addBiometricBGLogoSVG),
          fit: BoxFit.cover,
        ),
      ),
      child:  body,
    );
  }
}
