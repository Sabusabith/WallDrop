import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall4k/common/colors.dart';

import '../controller/bottam_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => FadeInUp(from: 100,duration: Duration(milliseconds: 1000),delay: Duration(seconds: 1),
      child: BottomNavigationBar(type: BottomNavigationBarType.fixed,
            selectedItemColor: kiconcolor,
           unselectedFontSize: 0,
           unselectedItemColor: kiconcolor.withOpacity(.3),
            iconSize: 35,
            selectedFontSize: 0,
            elevation: .2,
            backgroundColor: Colors.transparent,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.changeTabIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ],
          ),
    ));
  }
}