import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';

import '../core/constant/size_constant.dart';

class CommonElevatedButton extends ElevatedButton {
  final String text;
  final double? radius;
  final Color? bgColor;
  final Color textColor;
  final FontWeight fontWeight;
  final double? fontSize;

  CommonElevatedButton(
      {super.key,
      required this.text,
      required super.onPressed,
      this.radius,
      this.bgColor,
      this.textColor = Colors.white,
      this.fontWeight = FontWeight.w500,
      this.fontSize})
      : super(
          child: CommonText(
            text: text,
            fontColor: textColor,
            textAlign: TextAlign.center,
            fontWeight: fontWeight,
            fontSize: fontSize ?? textSize35Px,
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: ConstColor.buttonColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 20.r),
            ),
          ),
        );
}
