import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_store/common/widgets/images/t_circular_image.dart';
import 'package:flutter_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_store/utils/constants/image_strings.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu( title: 'Name', value: 'Tran Bao Huyen Tram',onPressed: () {  },),
              TProfileMenu( title: 'Username', value: 'Tram',onPressed: () {  },),

              const SizedBox( height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox( height: TSizes.spaceBtwItems,),

              /// Heading Personal Info
              const TSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox( height: TSizes.spaceBtwItems,),

              TProfileMenu( title: 'User ID', value: '1708', icon: Iconsax.copy, onPressed: () {  }),
              TProfileMenu( title: 'Email', value: 'tramtbh1708@gmail.com',onPressed: () {  },),
              TProfileMenu( title: 'Phone number', value: '+84962-022-184',onPressed: () {  },),
              TProfileMenu( title: 'Gender', value: 'Female',onPressed: () {  },),
              TProfileMenu( title: 'Date of Birth', value: '17 Aug, 1996',onPressed: () {  },),
              const Divider(),
              const SizedBox( height: TSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


