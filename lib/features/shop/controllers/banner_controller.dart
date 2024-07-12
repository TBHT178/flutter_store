import 'package:flutter_store/data/repositories/banners/banner_repository.dart';
import 'package:flutter_store/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final carousalCurrentIndex = 0.obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update banner indicator
  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  /// -- Load banner data
  Future<void> fetchBanners() async{
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign banner
      this.banners.assignAll(banners);

    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    } finally{
      // Remove loading
      isLoading.value = false;
    }
  }
}
