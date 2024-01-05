// image_detail.dart

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/image_detail_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageDetail extends StatelessWidget {
  ImageDetail({super.key, required this.imageData});
  final String imageData;

  final ImageDetailController controller = Get.put(ImageDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.ontap();
        },
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageData),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(
                      () => controller.click.value
                          ? FadeInLeft(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.ontap();
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: kiconcolor.withOpacity(.9),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ),
                    Spacer(),
                    Obx(
                      () => controller.click.value
                          ? FadeInRight(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.ontap();
                                    controller.toggleFavorite(imageData);
                                  },
                                  child: Icon(
                                    controller.isFavorite(imageData)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30,
                                    color: controller.isFavorite(imageData)
                                        ? Colors.red
                                        : kiconcolor.withOpacity(.9),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                  () => controller.click.value
                      ? Expanded(
                          child: Align(
                            alignment: Alignment(0, .85),
                            child: FadeInDown(
                              child: InkWell(
                                onTap: () {
                                  _downloadImage(imageData);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kbgcolor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(
                                      Icons.file_download_outlined,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _downloadImage(String imageUrl) async {
    try {
      Dio dio = Dio();
      Response<Uint8List> response = await dio.get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data!),
        quality: 80,
        name: 'downloaded_image',
      );

      if (result['isSuccess']) {
        Get.snackbar(
          'Download Successful',
          'The image has been downloaded to the gallery.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.transparent.withBlue(4),
          colorText: kiconcolor,
        );
      } else {
        Get.snackbar(
          'Download Failed',
          'Failed to download the image: ${result['errorMessage']}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.transparent.withBlue(4),
          colorText: kiconcolor,
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
