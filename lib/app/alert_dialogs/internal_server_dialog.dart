import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../common_widgets/common_text.dart';
import '../common_widgets/common_text_button.dart';
import '../core/constant/asset_constant.dart';
import '../core/constant/common_method.dart';
import '../core/constant/size_constant.dart';
import '../core/them/const_color.dart';

getInternalServerErrorDialogWidget({String? errorMsg}) {
  return Dialog(
    shadowColor: ConstColor.color1E3F84,
    backgroundColor: ConstColor.colorF4F5F9,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getSize(value: 70).r)),
    insetPadding: EdgeInsets.all(getSize(value: 61).w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: getSize(value: 55).h,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(getSize(value: 50).h),
            child: SvgPicture.asset(ConstAsset.internalServerError,
                height: getSize(value: 119).h, width: getSize(value: 117).h),
          ),
        ),
        SizedBox(
          height: getSize(value: 20).h,
        ),
        CommonText(
          text: "Oops!",
          textAlign: TextAlign.center,
          fontSize: textSize50Px,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: getSize(value: 10).h,
        ),
        CommonText(
          text: errorMsg ?? "Something went wrong.\nPlease try again later.",
          textAlign: TextAlign.center,
          fontSize: textSize35Px,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: getSize(value: 100).h,
        ),
        SizedBox(
          height: getSize(value: 74).h,
          // width: getSize(value: 277).w,
          child: CommonTextButton(
              borderColor: ConstColor.blackColor,
              bgColor: ConstColor.colorFF0000,
              padding: EdgeInsets.only(
                  top: getSize(value: 15).h,
                  bottom: getSize(value: 15).h,
                  left: getSize(value: 65).w,
                  right: getSize(value: 62).w),
              fontSize: textSize32Px,
              fontWeight: FontWeight.w400,
              textColor: ConstColor.blackColor,
              text: "Try again",
              onPressed: () {
                Get.back();
              }),
        ),
        SizedBox(
          height: getSize(value: 70).h,
        ),
      ],
    ),
  );
}
