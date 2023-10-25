import 'package:flutter/material.dart';
import 'package:pay_day_manager/app/core/constant/size_constant.dart';

import '../core/them/const_color.dart';

class CommonText extends Text {
  CommonText(
      {super.key,
      required String text,
      Color? fontColor,
      double? fontSize,
      int? maxLine,
      TextOverflow? overflow,
      TextAlign? textAlign,
      TextDecoration? textDecoration,
      FontWeight? fontWeight,
      double? letterSpacing})
      : super(text,
            softWrap: true,
            overflow: overflow,
            maxLines: maxLine,
            style: TextStyle(
                // height: height ?? 3,
                // letterSpacing: letterSpacing ?? 0.02,
                decoration: textDecoration ?? TextDecoration.none,
                fontSize: fontSize ?? textSize40Px,
                color: fontColor ?? ConstColor.blackColor,
                fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: "Poppins"),
            textAlign: textAlign);
}
