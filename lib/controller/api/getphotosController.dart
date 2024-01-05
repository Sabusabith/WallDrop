


import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../model/apiModel/getImagesModel.dart';

class GetPhotosController extends GetxController {
  RxList<Photo> apiImages = <Photo>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchImages();
  }

  fetchImages() async {
    final String apiKey = "ziUAmbzZ7nhOwdtNxz3sYCJHcOTIL13RHzIrWxaey1bPZZKAeap9ZwsM"; // Replace with your actual API key
    final String apiUrl = "https://api.pexels.com/v1/curated?per_page=4000";

    try {
      final Dio dio = Dio();

      // Set up Dio options
      Options options = Options(
        headers: {
          'Authorization': apiKey,
        },
      );

      // Make the API request
      final Response response = await dio.get(apiUrl, options: options);

      if (response.statusCode == 200) {
        // Parse and handle the response
        GetImagesModel getImagesModel = GetImagesModel.fromJson(response.data);
        apiImages.assignAll(getImagesModel.photos);
        print("image result  ${getImagesModel.photos[0].src.portrait}");
      } else {
        // Handle error if response status code is not 200
        print("Error: ${response.statusCode}");
      }
    } catch (error) {
      // Handle Dio errors or exceptions
      print("Dio Error: $error");
    }
  }
}
