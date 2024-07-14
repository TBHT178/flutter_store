import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_store/data/enums/enums.dart';
import 'package:flutter_store/features/shop/models/product_model.dart';
import 'package:flutter_store/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../../../data/services/cloud_storage/firebase_storage_service.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get the product price or price range for variations/
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exit, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price )
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  /// Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <= 0.0 ) return null;
    if(originalPrice <=0 ) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) *100;
    return percentage.toStringAsFixed(0);
  }

  /// -- Check product stock status
  String getProductStockStatus (int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try { // upload all products along with images
      final storage = Get.put(TFirebaseStorageService());

      for (var product in products) {
        // get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(
            product.thumbnail);
        // upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // assign url to product.thumbnail attribute
        product.thumbnail = url;
        // product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // get image link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);
            //upload image and get url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);
            //assign url to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // upload variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(
                variation.image);
            // upload image and get url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);
            // assign url to variation.image
            variation.image = url;
          }
        }

        // Store product in Firebase
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Error loading image data: $e';
      }
    }
  }

}
