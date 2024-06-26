import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class CustomSpacingStyle{
  static const EdgeInsetsGeometry paddindWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );
}