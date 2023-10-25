import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';

import '../core/them/const_color.dart';

class CommonTextButton extends TextButton {
  final String text;
  final double? radius;
  final Color? borderColor;
  final Color? bgColor;
  final Color textColor;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  CommonTextButton(
      {super.key,
      required this.text,
      required super.onPressed,
      this.radius,
      this.borderColor,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.bgColor,
      this.fontSize,
      this.padding})
      : super(
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(horizontal: getSize(value: 33).w),
            child: CommonText(
              text: text,
              fontColor: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
              textAlign: TextAlign.center,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(radius ?? getSize(value: 70).r),
              side: BorderSide(
                  style: BorderStyle.solid,
                  color: borderColor ?? ConstColor.color1E3F84,
                  width: 2.w),
            ),
          ),
        );
}
