import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../model/favoritemodel.dart';

class FavoritesController extends GetxController {
  final RxList<FavoriteItem> favoriteItems = <FavoriteItem>[].obs;

  @override
  void onInit() {
    // Fetch favorite items from Hive and update the list
    updateFavoriteItems();

    // Listen for changes in the Hive box and update the list accordingly
    Hive.box<FavoriteItem>('favorites').watch().listen((event) {
      updateFavoriteItems();
    });

    super.onInit();
  }

  void updateFavoriteItems() {
    // Fetch favorite items from Hive and update the list
    List<FavoriteItem> items = Hive.box<FavoriteItem>('favorites').values.toList();
    favoriteItems.assignAll(items);
  }
}
