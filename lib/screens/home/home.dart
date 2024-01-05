import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/homecontroller.dart';
import 'package:wall4k/screens/drawer/drawer.dart';
import 'package:wall4k/screens/favorites/favorites.dart';
import 'package:wall4k/screens/page1/page1.dart';
import 'package:wall4k/screens/page2/page2.dart';
import 'package:wall4k/screens/page3/page3.dart';
import 'package:wall4k/widgets/mybottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/bottam_nav_controller.dart';
import '../../controller/searchController.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final BottomNavBarController controller = Get.put(BottomNavBarController());
  final HomeController homeController = Get.put(HomeController());
    TextEditingController searchControllerTextField = TextEditingController(); // Add a TextEditingController

  @override
  Widget build(BuildContext context) {
        SearchControllers searchController = Get.put(SearchControllers()); // Move initialization here

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      backgroundColor: kbgcolor,
      appBar: AppBar(centerTitle:homeController.search.value == false?true:false ,
        title: Obx(
          () => homeController.search.value == false
              ? FadeInDown(
                  from: 100,
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(seconds: 1),
                  child: Text(
                    "WallDrop",
                    style: GoogleFonts.audiowide(color: kiconcolor),
                  ),
                )
              : SizedBox(
                  height: 40,
                  child: TextField(onChanged:(value) {
                    searchController.filterImagesList(value);
                    
                  },
                  controller: searchControllerTextField,
                    cursorColor: kiconcolor,
                    style: TextStyle(color: Colors.grey.shade300),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              homeController.clickSearch();
                   searchControllerTextField.clear();
                            },
                            child: Icon(
                              Icons.close,
                              color: kiconcolor,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: kiconcolor.withOpacity(.7))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: kiconcolor.withOpacity(.7)))),
                  ),
                ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: FadeInRight(
                  from: 100,
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(seconds: 1),
                  child: Obx(
                    () => homeController.search.value == false
                        ? IconButton(
                            onPressed: () {
                              homeController.clickSearch();
                            },
                            icon: Icon(
                              CupertinoIcons.search,
                              color: kiconcolor,
                              size: 25,
                            ))
                        : SizedBox(),
                  )))
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
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(seconds: 1),
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
                return Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(child: Page1()),
                  ],
                );
              case 1:
                return Column(children:[   SizedBox(
                      height: 15,
                    ), Expanded(child: Favorites())]);
              case 2:
                return Page3();
              default:
                return Page1();
            }
          },
        ),
      ),
    );
  }
}
