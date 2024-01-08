import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/colors.dart';
import '../model/favoritemodel.dart';

class ImageDetailController extends GetxController {
  RxBool click = false.obs;
   RxBool clicks = false.obs;
  RxBool isLoading = false.obs;
  RxInt downloadCount = 0.obs; // Add a variable to store the download count
  late final Box<FavoriteItem> box;

  @override
  void onInit() {
    // Load download count from SharedPreferences
    loadDownloadCount();
init();
    super.onInit();
  }

  void ontap() {
    click.toggle();
  }

  void init() async {
    await Hive.initFlutter();
    box = await Hive.openBox<FavoriteItem>('favorites');
  }

  List<FavoriteItem> getFavoriteItems() {
    // Modify this line to use Hive for retrieving favorites
    return box.values.toList();
  }
  bool isFavorite(String imageUrl) {
    // Modify this line to use Hive for retrieving favorites
    List<FavoriteItem> favorites = box.values.toList();
    return favorites.any((item) => item.imageUrl == imageUrl);
    
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
               backgroundColor: kbgcolor.withOpacity(.6),
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
          backgroundColor: kbgcolor.withOpacity(.6),
        colorText: kiconcolor,
        );
    }
    print('Updated favorites: ${box.values.toList()}');
    
    // Trigger a rebuild of the widget tree
    update();
  }

  Future<void> loadDownloadCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    downloadCount.value = prefs.getInt('downloadCount') ?? 0;
  }

  Future<void> saveDownloadCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('downloadCount', downloadCount.value);
  }

  Future<void> incrementDownloadCount() async {
    downloadCount++;
    saveDownloadCount();
  }
}
