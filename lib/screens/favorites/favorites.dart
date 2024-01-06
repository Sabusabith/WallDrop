import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/screens/walppapers/walppapers.dart';

import '../../controller/favoritecontroller.dart';
import '../image_detail_Page/image_detail.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});
  final FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kbgcolor,
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Obx(
          () => GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .6,
              crossAxisSpacing: .1,
              mainAxisSpacing: 0,
            ),
            itemCount: controller.favoriteItems.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              String imageUrl = controller.favoriteItems[index].imageUrl;
              return FadeInUp(
                delay: const Duration(seconds: 0),
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: kbgcolor),
                  ),
                  color: const Color.fromRGBO(225, 227, 229, 100),
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (Context) =>
                                  ImageDetail(imageData: imageUrl)));
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) => const ShimmerEffect(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
