import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/screens/favorites/favorites.dart';
import 'package:wall4k/screens/favorites/favorites2.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.transparent.withOpacity(.8),
      child: Container(
        height: size.height,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              FadeInUp(
                from: 100,
                delay: Duration.zero,
                child: Text(
                  "WallDrop",
                  style: GoogleFonts.audiowide(
                      color: kiconcolor, fontSize: 20, letterSpacing: 1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeInLeft(
                  from: 100,
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(milliseconds: 200),
                  child: ExpansionTile(
                      shape: Border(),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 15),
                      title: Text(
                        "Categories",
                        style: GoogleFonts.audiowide(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Art",
                                style: GoogleFonts.catamaran(
                                    fontSize: 17,
                                    color: Colors.grey.shade200,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Abstract",
                                style: GoogleFonts.catamaran(
                                    fontSize: 17,
                                    color: Colors.grey.shade200,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Fantasy",
                                style: GoogleFonts.catamaran(
                                    fontSize: 17,
                                    color: Colors.grey.shade200,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ])),
              FadeInLeft(
                from: 100,
                duration: Duration(milliseconds: 1000),
                delay: Duration(milliseconds: 300),
                child: ListTile(onTap: (){
                  Get.to(Favorites2());
                },
                    shape: Border(),
                    title: Text(
                      "Favorites",
                      style: GoogleFonts.audiowide(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    )),
              ),
              FadeInLeft(
                from: 100,
                duration: Duration(milliseconds: 1000),
                delay: Duration(milliseconds: 400),
                child: ListTile(
                    shape: Border(),
                    title: Text(
                      "Settings",
                      style: GoogleFonts.audiowide(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
