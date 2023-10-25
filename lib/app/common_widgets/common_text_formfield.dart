import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_day_manager/app/core/constant/size_constant.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';

import '../core/constant/common_method.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField(
      {Key? key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.contentPadding,
      this.validator,
      this.keyboardType,
      this.maxLines = 1,
      this.onChanged,
      this.isReadOnly = false,
      this.textInputAction = TextInputAction.next,
      this.fillColor,
      this.maxLength,
      this.textCapitalization = TextCapitalization.none,
      this.textInputFormatter,
      this.labelText,
      this.obscureText,
      this.fontSize,
      this.hintFontWeight,
      this.fontColor,
      this.isMandatory = true,
      this.borderColor,
      this.hintFontColor,
      this.borderWidth,
      this.focusNode,
      this.enabled = true,
      this.dividerEnabled = false,
      this.textFieldTextAlign,
      this.autovalidate = false,
      this.borderRadius,
      this.onTap})
      : super(key: key);

  final TextEditingController? controller;

  final Function(String)? onChanged;
  final Function()? onTap;
  final String? hintText;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final String? Function(String?)? validator;

  final EdgeInsetsGeometry? contentPadding;

  final Color? fontColor;
  final Color? hintFontColor;

  final int? maxLines;

  final bool isReadOnly;
  final bool enabled;
  final bool dividerEnabled;

  final TextInputAction? textInputAction;

  final TextInputType? keyboardType;

  final Color? fillColor;

  final int? maxLength;

  final TextCapitalization textCapitalization;

  final List<TextInputFormatter>? textInputFormatter;

  final String? labelText;

  final bool? obscureText;

  final bool isMandatory;

  final double? fontSize;

  final double? borderRadius;
  final Color? borderColor;

  final FontWeight? hintFontWeight;
  final TextAlign? textFieldTextAlign;

  final double? borderWidth;
  final FocusNode? focusNode;
  final bool autovalidate;

  // final InputBorder _normalBorder = const OutlineInputBorder(
  //     borderSide: BorderSide(color: ConstColor.grayColor),
  //     borderRadius: BorderRadius.all(Radius.circular(30)));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      style: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w400),
      enabled: enabled,
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      onChanged: onChanged,
      readOnly: isReadOnly,
      maxLength: maxLength,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType ?? TextInputType.multiline,
      autovalidateMode: autovalidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      textCapitalization: textCapitalization,
      textAlign: textFieldTextAlign ?? TextAlign.start,
      inputFormatters: textInputFormatter,
      obscureText: obscureText ?? false,
      onFieldSubmitted: (val) {},
      onSaved: (val) {},
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        border: InputBorder.none,
        isDense: true,
        isCollapsed: false,
        contentPadding: contentPadding ??
            EdgeInsets.only(
                right: getSize(value: 45).w,
                left: getSize(value: 45).w,
                top: 15.h,
                bottom: 15.h),

        hintText: hintText,
        hintStyle: TextStyle(
          color: hintFontColor ?? ConstColor.hintTextColor,
          fontSize: fontSize ?? 12.r,
          fontWeight: hintFontWeight ?? FontWeight.w400,
          fontFamily: "Poppins",
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints:
            BoxConstraints(maxHeight: getSize(value: 68).h, maxWidth: 50.w),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor ?? ConstColor.blackColor,
              width: borderWidth ?? getSize(value: 1).h),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 10.r),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor ?? ConstColor.colorFF0000,
              width: borderWidth ?? getSize(value: 1).h),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10.r)),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? ConstColor.colorFF0000,
                width: borderWidth ?? getSize(value: 1).h),
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 10.r))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor ?? ConstColor.color1E3F84,
              width: borderWidth ?? getSize(value: 1).h),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 10.r),
          ),
        ),
        // counterStyle: const TextStyle(color: ConstColor.white),
        errorMaxLines: 2,
        errorStyle: TextStyle(
          color: ConstColor.colorFF0000,
          fontSize: fontSize ?? textSize40Px,
          fontWeight: hintFontWeight ?? FontWeight.w400,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
