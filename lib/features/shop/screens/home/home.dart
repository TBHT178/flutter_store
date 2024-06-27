import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_store/utils/constants/colors.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(

                /// -- Appbar
                children: [THomeAppBar()],

                /// -- Searchbar
                /// -- Categories
              ),
            ),
          ],
        ),
      ),
    );
  }
}
