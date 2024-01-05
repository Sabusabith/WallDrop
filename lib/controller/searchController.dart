import 'package:get/get.dart';

import '../common/images.dart';

class SearchControllers extends GetxController {
  RxList<Map<String, String>> filteredImages = <Map<String, String>>[].obs;

  void filterImagesList(String searchTerm) {
    String searchText = searchTerm.toLowerCase();

    filteredImages.assignAll(imagesList
        .where((image) => image['name']!.toLowerCase().contains(searchText))
        .toList());
  }
}
