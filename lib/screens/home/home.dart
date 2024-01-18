import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/api/searchController.dart';
import 'package:wall4k/controller/homecontroller.dart';
import 'package:wall4k/screens/drawer/drawer.dart';
import 'package:wall4k/screens/favorites/favorites.dart';
import 'package:wall4k/screens/profile/profile.dart';
import 'package:wall4k/screens/searchscreen.dart/searchScreen.dart';
import 'package:wall4k/screens/walppapers/walppapers.dart';
import 'package:wall4k/widgets/mybottom_navbar.dart';

import '../../controller/bottam_nav_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final BottomNavBarController controller = Get.put(BottomNavBarController());
  final HomeController homeController = Get.put(HomeController());
  TextEditingController searchControllerTextField = TextEditingController();
  SearchControllers searchControllers = Get.put(SearchControllers());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      onDrawerChanged: (isOpened) {
        homeController.clickSearch();
      },
      bottomNavigationBar: BottomNavBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
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
        title: FadeInDown(
          from: 100,
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "WallDrop",
              style: GoogleFonts.audiowide(color: kiconcolor),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FadeInRight(
                from: 100,
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(seconds: 1),
                child: IconButton(
                  onPressed: () {
                    Get.to(SearchScreen());
                  },
                  icon: Icon(
                    CupertinoIcons.search,
                    color: kiconcolor,
                    size: 30,
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              // _showBottomSheet(context, size);
              _showWatchAddDialog(context);
            },
            child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/gem.png",
                      height: 25,
                    ),
                    Text(
                      "20",
                      style: GoogleFonts.dmSans(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )),
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Center(
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: FadeInLeft(
                  from: 100,
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(seconds: 1),
                  child: Image.asset(
                    "assets/images/menu.png",
                    color: kiconcolor,
                    height: 25,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Obx(
          () {
            switch (controller.currentIndex.value) {
              case 0:
                return Wallpapers();
              case 1:
                return Favorites();
              case 2:
                return Profile();
              default:
                return Wallpapers();
            }
          },
        ),
      ),
    );
  }
}

_showBottomSheet(BuildContext context, Size size) {
  return showModalBottomSheet(
    backgroundColor: Color.fromARGB(255, 2, 2, 2),
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: size.width,
        height: 300, // Set the height of your bottom sheet
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),

                      // Change color as needed
                      height: 150,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$499",
                            style: GoogleFonts.dmSans(
                                color: kiconcolor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ), // Set height as needed
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber.shade400,
                          borderRadius: BorderRadius.circular(15)),
                      // Change color as needed
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$499",
                            style: GoogleFonts.dmSans(
                                color: kiconcolor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ), // Set height as needed
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void _showWatchAddDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 3, 3, 3),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        title: Text(
          "Watch Ad",
          style: GoogleFonts.dmSans(color: Colors.white),
        ),
        content: Text("Watch an ad to earn points.",
            style: GoogleFonts.dmMono(color: Colors.white)),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 61, 57, 57)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
            onPressed: () {
              // Add your logic here for watching the ad
              // For example, you can call a function to handle watching the ad
              _watchAd();
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Watch Ad",style: TextStyle(color: Colors.white),),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 61, 57, 57)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Cancel",style: TextStyle(color: Colors.white),),
          ),
        ],
      );
    },
  );
}

// Function to handle watching the ad
void _watchAd() {
  // Add your logic here for watching the ad
  // For example, you can increment the points or perform other actions
  print("Watch Ad logic");
}
