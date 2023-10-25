import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_day_manager/app/common_widgets/common_text_button_with_icon.dart';

import '../core/constant/common_method.dart';
import '../core/constant/size_constant.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextButtonWithIcon(
      onPressed: onPressed,
      text: 'Back',
      radius: getSize(value: 50).r,
      fontWeight: FontWeight.w400,
      fontSize: textSize35Px,
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: getSize(value: 28).w),
        child: SvgPicture.asset(
          'assets/assets_svg/arrow_back.svg',
          height: getSize(value: 25).h,
          width: getSize(value: 16).w,
        ),
      ),
    );
  }
}
