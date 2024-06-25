import 'package:flutter/material.dart';
import 'package:flutter_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:flutter_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter_store/utils/theme/custom_themes/text_theme.dart';

class CustomTheme {
  CustomTheme._();

  // -- Light Theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: CustomTextTheme.lightTextTheme,
      chipTheme: CustomChipTheme.lightChiptheme,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
      checkboxTheme: CustomCheckBoxTheme.lightCheckboxTheme,
      bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CustomTextTheme.darkTextTheme,
      chipTheme: CustomChipTheme.darkChiptheme,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme,
      checkboxTheme: CustomCheckBoxTheme.darkCheckboxTheme,
      bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme);
}
