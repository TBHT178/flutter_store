import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter_store/features/shop/screens/product_reviews/widgets/rating_star.dart';
import 'package:flutter_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      /// -- Appbar
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Rating and reviews are verified'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// -- Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5,),
              Text('1.708', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// -- User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),


            ],
          ),
        ),
      ),
    );
  }
}





