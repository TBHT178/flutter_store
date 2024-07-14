import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_store/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../enums/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// FireStore instance
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async{
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload dummy data to Cloud Firebase
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

