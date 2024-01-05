import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wall4k/controller/api/getphotosController.dart';
import 'package:wall4k/screens/image_detail_Page/image_detail.dart';
import 'package:wall4k/common/colors.dart';

import '../../controller/api/searchController.dart';
import '../../model/apiModel/getImagesModel.dart';

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);
  SearchControllers searchControllers = Get.put(SearchControllers());

  @override
  Widget build(BuildContext context) {
    final GetPhotosController photosController = Get.put(GetPhotosController());

    return Container(
      color: kbgcolor,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: FutureBuilder(
          future: photosController.fetchImages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Container(width: 100,height: 30,
                    child: LoadingIndicator(
                                    indicatorType: Indicator.ballPulseSync,
                                    colors: [kiconcolor],
                                    strokeWidth: .1,
                                  ),
                  ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Use the list of apiImages from the controller
              List<Photo> apiImages = photosController.apiImages;

              return GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .6,
                  crossAxisSpacing: .1,
                  mainAxisSpacing: 0,
                ),
                itemCount: apiImages.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kbgcolor),
                    ),
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageDetail(
                              imageData: apiImages[index].src.portrait,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: apiImages[index].src.portrait.toString(),
                            placeholder: (context, url) => ShimmerEffect(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildSearchResults() {
    return Obx(() {
      if (searchControllers.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: searchControllers.searchResults.length,
          itemBuilder: (context, index) {
            // Customize how you want to display search results
            return ListTile(
              title: Image(
                  image: NetworkImage(
                      searchControllers.searchResults[index].src.portrait)),
              subtitle: Text(
                'ID: ${searchControllers.searchResults[index].id}',
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
