import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wall4k/common/colors.dart';

import '../../controller/api/searchController.dart';
import '../image_detail_Page/image_detail.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController searchControllerTextField = TextEditingController();
  SearchControllers searchControllers = Get.put(SearchControllers());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: kbgcolor,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(size.width, 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Results",
                        style: GoogleFonts.audiowide(color: kiconcolor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FadeInRight(
                from: 100,
                child: Obx(() => GestureDetector(
                    onTap: () {
                      searchControllers.changeGrid();
                    },
                    child: searchControllers.change.value
                        ? Icon(
                            Icons.list_alt_outlined,
                            color: kiconcolor,
                            size: 35,
                          )
                        : Icon(
                            Icons.grid_view_outlined,
                            color: kiconcolor,
                            size: 35,
                          )))),
          )
        ],
        toolbarHeight: 90,
        leading: FadeInUp(
          child: GestureDetector(
            onTap: () {
              searchControllerTextField.clear();
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: kiconcolor,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: FadeInRight(
          from: 100,
          child: SizedBox(
            height: 40,
            child: Transform(
              transform: Matrix4.translationValues(-10, 0, 0),
              child: TextField(
                onChanged: (value) {
                  searchControllerTextField.text = value;

                  searchControllers.searchImages(value, "1000");
                },
                controller: searchControllerTextField,
                cursorColor: kiconcolor,
                style: TextStyle(color: Colors.grey.shade300),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: kiconcolor.withOpacity(.6),
                  ),
                  hintText: "Search...",
                  hintStyle: GoogleFonts.dmMono(
                      color: kiconcolor.withOpacity(.6), letterSpacing: 2),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: kiconcolor.withOpacity(.7)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: kiconcolor.withOpacity(.7)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Obx(() => Expanded(
                child: searchControllers.change.value
                    ? buildSearchResults()
                    : buildSearchResults2()))
          ],
        ),
      ),
    );
  }

  Widget buildSearchResults() {
    return Obx(() {
      if (searchControllers.isLoading.value) {
        return Center(
            child: SizedBox(
          width: 100,
          height: 30,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulseSync,
            colors: [kiconcolor],
            strokeWidth: .1,
          ),
        ));
      } else {
        return ListView.builder(
          itemCount: searchControllers.searchResults.length,
          itemBuilder: (context, index) {
            final photo = searchControllers.searchResults[index];

            // Customize how you want to display search results
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              height: 430,
              margin: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageDetail(
                        imageData: photo.src.portrait,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: photo.src.portrait,
                    height: 120,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ShimmerEffect(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }

  Widget buildSearchResults2() {
    return Obx(() {
      if (searchControllers.isLoading.value) {
        return Center(
            child: Center(
                child: SizedBox(
          width: 100,
          height: 30,
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
          itemCount: searchControllers.searchResults.length,
          itemBuilder: (context, index) {
            final photo = searchControllers.searchResults[index];
            return Card(
              child: GestureDetector(
                onTap: () {
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
