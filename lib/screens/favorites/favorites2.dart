import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/screens/home/home.dart';

import '../../controller/favoritecontroller.dart';
import '../image_detail_Page/image_detail.dart';
import '../searchscreen.dart/searchScreen.dart';

class Favorites2 extends StatelessWidget {
  Favorites2({super.key});
  final FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(size.width, 20),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )),
        centerTitle: true,
        title: FadeInDown(
          from: 100,
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(seconds: 0),
          child: Text(
            "Favorites",
            style: GoogleFonts.audiowide(color: kiconcolor),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FadeInRight(
                from: 100,
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(seconds: 0),
                child: IconButton(
                  onPressed: () {
                    Get.to(SearchScreen());
                  },
                  icon: Icon(
                    CupertinoIcons.search,
                    color: kiconcolor,
                    size: 25,
                  ),
                )),
          ),
        ],
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.to(Home());
                },
                child: FadeInLeft(
                    from: 100,
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(seconds: 0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kiconcolor,
                    )),
              ),
            ),
          );
        }),
      ),
      body: Container(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            placeholder: (context, url) => ShimmerEffect(),
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
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white, // You can set the shimmer color here
      ),
    );
  }
}
