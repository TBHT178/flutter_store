import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class CustomSpacingStyle{
  static const EdgeInsetsGeometry paddindWithAppBarHeight = EdgeInsets.only(
    top: CustomSizes.appBarHeight,
    left: CustomSizes.defaultSpace,
    bottom: CustomSizes.defaultSpace,
    right: CustomSizes.defaultSpace,
  );
}