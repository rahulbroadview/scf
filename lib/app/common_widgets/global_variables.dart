import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constant/asset_constant.dart';
import '../core/constant/common_method.dart';
import '../core/them/const_color.dart';

var devicePixelRatio = 1.0;
Widget downArrow = SvgPicture.asset(
  ConstAsset.downArrowSVG,
  colorFilter: const ColorFilter.mode(
    ConstColor.color009846,
    BlendMode.srcIn,
  ),
  allowDrawingOutsideViewBox: true,
  height: getSize(value: 25).h,
  width: getSize(value: 16).w,
);

Widget bellIcon = SvgPicture.asset(
  ConstAsset.bellIconSVG,
  colorFilter: const ColorFilter.mode(
    ConstColor.color1E3F84,
    BlendMode.srcIn,
  ),
  // allowDrawingOutsideViewBox: true,
  height: getSize(value: 78).h,
  width: getSize(value: 64).w,
);
Widget dollarIcon = SvgPicture.asset(
  ConstAsset.dollarIconSVG,
  colorFilter: const ColorFilter.mode(
    ConstColor.blackColor,
    BlendMode.srcIn,
  ),
  // allowDrawingOutsideViewBox: true,
);
// SvgPicture.asset(ConstAsset.backgroundSVG,
// colorFilter: const ColorFilter.mode(
// ConstColor.blackColor,
// BlendMode.srcIn,
// ),
// allowDrawingOutsideViewBox: true,
//
// ),