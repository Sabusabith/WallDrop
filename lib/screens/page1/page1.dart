// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wall4k/common/colors.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:wall4k/controller/searchController.dart';
// import 'package:wall4k/screens/image_detail_Page/image_detail.dart';

// import '../../common/images.dart';

// class Page1 extends StatelessWidget {
//   const Page1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final SearchControllers searchController = Get.find<SearchControllers>();
//     List<Map<String, String>> filteredImages = searchController.filteredImages;

//     return Container(
//       color: kbgcolor,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 5,
//           right: 5,
//         ),
//         child: Obx(()=>
//            GridView.builder(
//             physics: BouncingScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: .6,
//               crossAxisSpacing: .1,
//               mainAxisSpacing: 0,
//             ),
//             itemCount: filteredImages.isNotEmpty ? filteredImages.length : imagesList.length,
//             primary: false,
//             shrinkWrap: true,
//             itemBuilder: (BuildContext context, int index) {
//               return Card(
//                 shape: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(color: kbgcolor),
//                 ),
//                 color: Color.fromRGBO(225, 227, 229, 100),
//                 elevation: 3,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ImageDetail(imageData: imagesList[index]['url'].toString()),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: CachedNetworkImage(
//                         imageUrl: imagesList[index]['url'].toString(),
//                         placeholder: (context, url) => ShimmerEffect(),
//                         errorWidget: (context, url, error) => Icon(Icons.error),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


// class ShimmerEffect extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: Container(
//         color: Colors.white, // You can set the shimmer color here
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall4k/common/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wall4k/controller/searchController.dart';
import 'package:wall4k/screens/image_detail_Page/image_detail.dart';

import '../../common/images.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchControllers searchController = Get.find<SearchControllers>();
    List<Map<String, String>> filteredImages = searchController.filteredImages;

    return Container(
      color: kbgcolor,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Obx(() {
          // Check if searchController.loading is true (optional, if you have a loading state)
       

          // Check if the search result is empty
     

          return GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .6,
              crossAxisSpacing: .1,
              mainAxisSpacing: 0,
            ),
            itemCount: filteredImages.isNotEmpty ? filteredImages.length : imagesList.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kbgcolor),
                ),
                color: Color.fromRGBO(225, 227, 229, 100),
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageDetail(imageData:filteredImages.isNotEmpty ?filteredImages[index]['url'].toString(): imagesList[index]['url'].toString()),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: filteredImages.isNotEmpty ?filteredImages[index]['url'].toString(): imagesList[index]['url'].toString(),
                        placeholder: (context, url) => ShimmerEffect(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
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
