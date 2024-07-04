import 'package:flutter/material.dart';
import 'package:flutter_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_store/utils/constants/colors.dart';
import 'package:flutter_store/utils/theme/theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: CustomTheme.darkTheme,
      theme: CustomTheme.lightTheme,
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: TColors.white,),),),

    );
  }
}