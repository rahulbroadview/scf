import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_day_manager/app/common_widgets/common_text.dart';

import '../core/constant/common_method.dart';
import '../core/constant/size_constant.dart';
import '../core/them/const_color.dart';

class CommonAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBarWidget({
    super.key,
    required this.title,
  });

  @override
  State<CommonAppBarWidget> createState() => _CommonAppBarWidgetState();

  @override
  Size get preferredSize =>
      const Size(kTextTabBarHeight + 40, kTextTabBarHeight + 40);
}

class _CommonAppBarWidgetState extends State<CommonAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: CommonText(
            text: widget.title,
            fontColor: ConstColor.colorFF0000,
            fontSize: textSize50Px,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: SvgPicture.asset(
                height: getSize(value: 59).h,
                width: getSize(value: 78).w,
                "assets/assets_svg/envelope.svg",
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                // border: Border.all(width: 0, color: ConstColor.color1E3F84),
                color: ConstColor.color1E3F84, //ConstColor.color1E3F84
              ),
              height: 29.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
              ),
              height: 30.h,
            )
          ],
        ),
      ],
    );
  }
}
