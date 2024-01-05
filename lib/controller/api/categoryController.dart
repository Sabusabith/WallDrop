// search_controller.dart
import 'package:get/get.dart';
import 'package:dio/dio.dart'; // Import Dio package
import 'package:wall4k/model/apiModel/searchModel.dart';

class CategoryController extends GetxController {
  final Dio _dio = Dio();
  RxBool isLoading = false.obs;
  RxList<Photo> searchResults = <Photo>[].obs;
  RxBool change = false.obs;

  changeGrid(){
    change.value = !change.value;
  }

  searchImages(String query, String count) async {
    isLoading.value = true;
    const String apiKey = 'ziUAmbzZ7nhOwdtNxz3sYCJHcOTIL13RHzIrWxaey1bPZZKAeap9ZwsM';
    final String apiUrl = 'https://api.pexels.com/v1/search?query=$query&per_page=$count';

    try {
      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {'Authorization': apiKey},
        ),
      );

      if (response.statusCode == 200) {
        searchResults.assignAll(SearchModel.fromJson(response.data).photos);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
