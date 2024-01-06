import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageDetailController extends GetxController {
  RxBool click = false.obs;
  RxBool isLoading = false.obs;
  RxInt downloadCount = 0.obs; // Add a variable to store the download count

  @override
  void onInit() {
    // Load download count from SharedPreferences
    loadDownloadCount();

    super.onInit();
  }

  void ontap() {
    click.toggle();
  }

  bool isFavorite(String imageUrl) {
    // Implementation of checking if the image is a favorite
    // You can use your existing logic here
    // For example, you can have a list of favorite images and check if imageUrl is in the list
    return false;
  }

  void toggleFavorite(String imageUrl) {
    // Implementation of toggling favorite status
    // You can use your existing logic here
    // For example, you can add/remove imageUrl from the list of favorite images
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
