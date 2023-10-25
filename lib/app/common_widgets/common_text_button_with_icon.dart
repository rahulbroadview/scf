import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';
import 'package:pay_day_manager/app/core/constant/size_constant.dart';

class CommonTextButtonWithIcon extends TextButton {
  final String text;
  final double radius;
  final Color borderColor;
  final Color textColor;
  final Color? bgColor;
  final FontWeight fontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? fontSize;

  CommonTextButtonWithIcon(
      {super.key,
      required this.text,
      required super.onPressed,
      this.radius = 20,
      this.borderColor = Colors.black,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.prefixIcon,
      this.suffixIcon,
      this.fontSize,
      this.bgColor})
      : super(
          child: Row(
            children: [
              prefixIcon ?? const SizedBox(),
              SizedBox(
                width: getSize(value: 15).w,
              ),
              Expanded(
                child: CommonText(
                  text: text,
                  fontColor: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  maxLine: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              suffixIcon ?? SizedBox(width: getSize(value: 15).w),
            ],
          ),
          style: TextButton.styleFrom(
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(style: BorderStyle.solid, color: borderColor, width: getSize(value: 1).h),
              ),
              padding: EdgeInsets.zero),
        );
}

class CommonButtonWithIcon extends TextButton {
  final String hintText;
  final String text;
  final double radius;
  final Color borderColor;
  final Color textColor;
  final Color? bgColor;
  final FontWeight fontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  CommonButtonWithIcon(
      {super.key,
      required this.hintText,
      required this.text,
      required super.onPressed,
      this.radius = 20,
      this.borderColor = Colors.black,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.prefixIcon,
      this.suffixIcon,
      this.bgColor})
      : super(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: getSize(value: 50).w),
                child: Align(alignment: Alignment.centerLeft, child: prefixIcon ?? const SizedBox()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CommonText(
                        text: hintText,
                        maxLine: 1,
                        fontSize: textSize32Px,
                        fontColor: textColor,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        text,
                        style: TextStyle(fontSize: textSize40Px, color: textColor, fontWeight: FontWeight.w700, fontFamily: "Poppins"),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  suffixIcon ?? const SizedBox(),
                ],
              ),
            ],
          ),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(style: BorderStyle.solid, color: borderColor, width: getSize(value: 1).w),
            ),
          ),
        );
}

class CommonRowIconButton extends TextButton {
  final String text;
  final double radius;
  final Color borderColor;
  final Color textColor;
  final Color? bgColor;
  final FontWeight fontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  CommonRowIconButton(
      {super.key,
      required this.text,
      required super.onPressed,
      this.radius = 20,
      this.borderColor = Colors.black,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.prefixIcon,
      this.suffixIcon,
      this.bgColor})
      : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: getSize(value: 25).w),
                child: prefixIcon ?? const SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.only(left: getSize(value: 10).w, right: getSize(value: 40).w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: textSize32Px, color: textColor, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                    ),
                    // suffixIcon ?? const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(style: BorderStyle.solid, color: borderColor, width: getSize(value: 1).h),
            ),
          ),
        );
}

class CommonRowSaveTeamButton extends TextButton {
  final String text;
  final double radius;
  final Color borderColor;
  final Color textColor;
  final Color? bgColor;
  final FontWeight fontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  CommonRowSaveTeamButton(
      {super.key,
      required this.text,
      required super.onPressed,
      this.radius = 20,
      this.borderColor = Colors.black,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.prefixIcon,
      this.suffixIcon,
      this.bgColor})
      : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: getSize(value: 30).w),
                child: prefixIcon ?? const SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.only(right: getSize(value: 30).w),
                child: Text(
                  text,
                  style: TextStyle(fontSize: textSize32Px, color: textColor, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                ),
              ),
              const SizedBox()
            ],
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(style: BorderStyle.solid, color: borderColor, width: getSize(value: 1).h),
            ),
          ),
        );
}

class CommonRowSuffixIconButton extends TextButton {
  final String text;
  final double radius;
  final Color borderColor;
  final Color textColor;
  final Color? bgColor;
  final FontWeight? fontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? sizedBox;

  CommonRowSuffixIconButton(
      {super.key,
      required this.text,
      required super.onPressed,
      this.radius = 20,
      this.borderColor = Colors.black,
      this.textColor = Colors.black,
      this.fontWeight,
      this.prefixIcon,
      this.suffixIcon,
      this.bgColor,
      this.sizedBox})
      : super(
          child: sizedBox != null && sizedBox
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Padding(
                      padding: EdgeInsets.only(left: getSize(value: 40).w),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: textSize35Px, color: textColor, fontWeight: fontWeight ?? FontWeight.w400, fontFamily: "Poppins"),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: getSize(value: 10).w),
                      child: suffixIcon ?? const SizedBox(),
                    ),
                    // suffixIcon ?? const SizedBox(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: getSize(value: 40).w),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: textSize35Px, color: textColor, fontWeight: fontWeight ?? FontWeight.w400, fontFamily: "Poppins"),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: getSize(value: 10).w),
                      child: suffixIcon ?? const SizedBox(),
                    ),
                    // suffixIcon ?? const SizedBox(),
                  ],
                ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(style: BorderStyle.solid, color: borderColor, width: getSize(value: 1).h),
            ),
          ),
        );
}

class CommonRowSpaceIconButton extends TextButton {
  final String text;
  final double radius;
  final Color borderColor;
  final Color textColor;
  final Color? bgColor;
  final FontWeight fontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  CommonRowSpaceIconButton(
      {super.key,
      required this.text,
      required super.onPressed,
      this.radius = 20,
      this.borderColor = Colors.black,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.prefixIcon,
      this.suffixIcon,
      this.bgColor})
      : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: getSize(value: 25).w),
                child: prefixIcon ?? const SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.only(left: getSize(value: 10).w, right: getSize(value: 40).w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: textSize32Px, color: textColor, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                    ),
                    // suffixIcon ?? const SizedBox(),
                  ],
                ),
              ),
              const SizedBox()
            ],
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(style: BorderStyle.solid, color: borderColor, width: getSize(value: 1).h),
            ),
          ),
        );
}
