import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';
import 'package:pay_day_manager/app/core/constant/size_constant.dart';

import '../common_widgets/common_text.dart';
import '../core/them/const_color.dart';

class CommonDialogHeader extends StatelessWidget {
  final Widget child;
  final String title;
  final Color? headerColor;
  final Color? textColor;
  final Color? bgColor;
  final bool showCloseIcon;

  const CommonDialogHeader(
      {super.key,
      required this.child,
      required this.title,
      this.headerColor,
      this.textColor,
      this.bgColor,
      this.showCloseIcon = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: getSize(value: 67).w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getSize(value: 70).r)),
      backgroundColor: bgColor,
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: getSize(value: 127).h,
              decoration: BoxDecoration(
                color: headerColor ?? ConstColor.textColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getSize(value: 70).r),
                    topRight: Radius.circular(getSize(value: 70).r)),
              ),
              child: showCloseIcon
                  ? Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 35.w),
                              child: CommonText(
                                text: title,
                                fontSize: textSize45Px,
                                fontWeight: FontWeight.w600,
                                fontColor: textColor ?? Colors.white,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20.w,
                            ),
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: CommonText(
                      text: title,
                      fontSize: textSize45Px,
                      fontWeight: FontWeight.w600,
                      fontColor: textColor ?? Colors.white,
                      textAlign: TextAlign.center,
                    )),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
