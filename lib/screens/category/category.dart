// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/api/categoryController.dart';
import 'package:wall4k/screens/image_detail_Page/image_detail.dart';
import 'package:wall4k/screens/searchscreen.dart/searchScreen.dart';

import '../home/home.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key,required this.name});
  String name;
  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(  extendBody: true,
      extendBodyBehindAppBar: true,backgroundColor: kbgcolor,
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
           name,
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
      body: SizedBox(width: size.width,height: size.height,
      child: buildSearchResults2(),),
      
      );
  }




//widget for show the result
  Widget buildSearchResults2() {
    return Obx(() {
      if (categoryController.isLoading.value) {
        return Center(child: Center(
                  child: SizedBox(width: 100,height: 30,
                    child: LoadingIndicator(
                                    indicatorType: Indicator.ballPulseSync,
                                    colors: [kiconcolor],
                                    strokeWidth: .1,
                                  ),
                  )));
      } else {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .6,
            crossAxisSpacing: .1,
            mainAxisSpacing: 0,
          ),
          itemCount: categoryController.searchResults.length,
          itemBuilder: (context, index) {
            final photo = categoryController.searchResults[index];
            return Card(
              child: GestureDetector(onTap: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageDetail(
                              imageData: photo.src.portrait,
                            ),
                          ),
                        );
              },
                child: CachedNetworkImage(
                  imageUrl: photo.src.portrait,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => ShimmerEffect(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          },
        );
      }
    });
  }
}





