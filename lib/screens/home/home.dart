import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/api/searchController.dart';
import 'package:wall4k/controller/homecontroller.dart';
import 'package:wall4k/screens/drawer/drawer.dart';
import 'package:wall4k/screens/favorites/favorites.dart';
import 'package:wall4k/screens/page1/page1.dart';
import 'package:wall4k/screens/page3/page3.dart';
import 'package:wall4k/screens/searchscreen.dart/searchScreen.dart';
import 'package:wall4k/widgets/mybottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(onDrawerChanged: (isOpened) {
      homeController.clickSearch();
    },
      bottomNavigationBar: BottomNavBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(),
      backgroundColor: kbgcolor,
      appBar: AppBar(  bottom: PreferredSize(
            preferredSize: Size(size.width, 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 5,)
,                
                  SizedBox(height: 10,)
                ],
              ),
            )),
        centerTitle:  true ,
        title:
               FadeInDown(
                  from: 100,
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(seconds: 1),
                  child: Text(
                    "WallDrop",
                    style: GoogleFonts.audiowide(color: kiconcolor),
                  ),
                ),
             
      
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FadeInRight(
              from: 100,
              duration: Duration(milliseconds: 1000),
              delay: Duration(seconds: 1),
              child: IconButton(
                        onPressed: () {
                        Get.to(SearchScreen());
                        },
                        icon: Icon(
                          CupertinoIcons.search,
                          color: kiconcolor,
                          size: 25,
                        ),
                      )
                 
              ),
            ),
        
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
                return Page1();
              case 1:
                return Favorites();
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