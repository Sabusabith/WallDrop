import 'dart:math'; // Import the dart:math library
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/api/getphotosController.dart';
import 'package:wall4k/controller/splashController.dart';
import 'package:wall4k/screens/image_detail_Page/image_detail.dart';

import '../../controller/api/searchController.dart';
import '../../model/apiModel/getImagesModel.dart';
import '../../service/network_status/networkStatus.dart';

class Wallpapers extends StatelessWidget {
  Wallpapers({Key? key}) : super(key: key);
  SearchControllers searchControllers = Get.put(SearchControllers());

  final List<int> indicesToShowPrice = [1, 3, 4, 18, 45, 7, 12, 21, 31, 34];
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final GetPhotosController photosController =
        Get.put(GetPhotosController());

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
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballPulseSync,
                    colors: [kiconcolor],
                    strokeWidth: .1,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Photo> apiImages = photosController.apiImages;

              return GridView.builder(
                physics: const BouncingScrollPhysics(),
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
                  bool showPriceCondition = indicesToShowPrice.contains(index);

                  // Generate a random price between 10 and 30
                  int randomPrice = random.nextInt(21) + 10;

                  return Card(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kbgcolor),
                    ),
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        checkConnection();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageDetail(
                              imageData: apiImages[index].src.portrait,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl:
                                    apiImages[index].src.portrait.toString(),
                                placeholder: (context, url) =>
                                    const ShimmerEffect(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (showPriceCondition)
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.transparent.withOpacity(.6),
                                    borderRadius: BorderRadius.circular(30)),
                                child: FadeInLeft(from: 100,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/gem.png",
                                        height: 25,
                                      ),
                                      Text(
                                        "$randomPrice",
                                        style: GoogleFonts.dmSans(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
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
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: searchControllers.searchResults.length,
          itemBuilder: (context, index) {
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
  checkConnection() async {
    bool network = await internetCheck();

    if (network) {
      
    
    } else {
       
       Future.delayed(Duration(seconds: 3), () {
        Get.to(NoConnection());
      
    });
    
  

    }
  }

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

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
