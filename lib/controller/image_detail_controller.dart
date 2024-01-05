// image_detail_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../common/colors.dart';
import '../model/favoritemodel.dart';

class ImageDetailController extends GetxController {
  RxBool click = false.obs;
   RxBool clicks = false.obs;
  RxBool isLoading = false.obs;

  // Modify this line to use Hive box for favorites
  late final Box<FavoriteItem> box;

  // Initialize Hive box in the constructor
  ImageDetailController() {
    init();
  }

  void init() async {
    await Hive.initFlutter();
    box = await Hive.openBox<FavoriteItem>('favorites');
  }

  ontap() {
    click.value = !click.value;
  }

  Future<void> toggleFavorite(String imageUrl) async {
    clicks. value = !clicks.value;
    List<FavoriteItem> favorites = box.values.toList();

    print('Current favorites: $favorites');

    if (favorites.any((item) => item.imageUrl == imageUrl)) {
      int indexToDelete =
          favorites.indexWhere((item) => item.imageUrl == imageUrl);

      print('Index to delete: $indexToDelete');

      if (indexToDelete != -1) {
        await box.deleteAt(indexToDelete);
         Get.snackbar(
          'Item removed',
          'Item removed from favorites',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.transparent.withBlue(4),
          colorText: kiconcolor,
        );
        print('Item deleted');
      }
    } else {
      await box.add(FavoriteItem(imageUrl));
      print('Item added');
       Get.snackbar(
          'Item added',
          'Item added to favorites',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.transparent.withBlue(4),
          colorText: kiconcolor,
        );
    }

    print('Updated favorites: ${box.values.toList()}');
    
    // Trigger a rebuild of the widget tree
    update();
  }

  bool isFavorite(String imageUrl) {
    // Modify this line to use Hive for retrieving favorites
    List<FavoriteItem> favorites = box.values.toList();
    return favorites.any((item) => item.imageUrl == imageUrl);
    
  }

  List<FavoriteItem> getFavoriteItems() {
    // Modify this line to use Hive for retrieving favorites
    return box.values.toList();
  }
}
