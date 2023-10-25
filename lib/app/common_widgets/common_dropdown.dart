import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';
import 'package:pay_day_manager/app/core/constant/common_method.dart';

import '../core/constant/size_constant.dart';
import 'global_variables.dart';

class CommonDropDownWidget extends StatelessWidget {
  const CommonDropDownWidget(
      {super.key,
      required this.items,
      required this.selectedValue,
      this.width,
      this.buttonHeight,
      this.onChanged,
      this.borderColor,
      this.iconColor,
      this.hintText,
      this.radius});

  final List<String> items;
  final String selectedValue;
  final Text? hintText;
  final ValueChanged? onChanged;
  final double? buttonHeight;
  final double? width;
  final Color? borderColor;
  final Color? iconColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: hintText,
        isExpanded: true,
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: CommonText(
                    text: item,
                    fontSize: textSize35Px,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        isDense: true,
        icon: downArrow,
        iconEnabledColor: Colors.black,
        buttonHeight: buttonHeight ?? 50,
        buttonWidth: width ?? 200.w,
        buttonPadding: EdgeInsets.only(
            left: getSize(value: 45).w, right: getSize(value: 45).w),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? getSize(value: 70).r),
          border: Border.all(
              color: borderColor ?? Colors.black26, width: getSize(value: 1).h),
          color: Colors.white,
        ),
        itemHeight: 40.h,
        // itemPadding: EdgeInsets.only(
        //   right: getSize(value: 45).w,
        //   left: getSize(value: 45).w,
        // ),
        dropdownMaxHeight: 200,
        dropdownWidth: width ?? 160.w,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? getSize(value: 70).r),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: Radius.circular(radius ?? getSize(value: 70).r),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }
}
