// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/screens/category/category.dart';
import 'package:wall4k/screens/favorites/favorites2.dart';

import '../../controller/api/categoryController.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.transparent.withOpacity(.8),
      child: SizedBox(
        height: size.height,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              FadeInLeft(
                  from: 100,
                  delay: const Duration(milliseconds: 60),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ExpansionTile(
                        shape: const Border(),
                        childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
                        title: Text(
                          "Categories",
                          style: GoogleFonts.audiowide(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                        children: [
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Art", "10000");
                                Get.to(CategoryScreen(
                                  name: "Art",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
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
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Abstract", "10000");
                                Get.to(CategoryScreen(
                                  name: "Abstract",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
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
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Fantasy", "10000");
                                Get.to(CategoryScreen(
                                  name: "Fantasy",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
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
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "3D", "10000");
                                Get.to(CategoryScreen(
                                  name: "3D",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "3D",
                                      style: GoogleFonts.catamaran(
                                          fontSize: 17,
                                          color: Colors.grey.shade200,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Black", "10000");
                                Get.to(CategoryScreen(
                                  name: "Black",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Black",
                                      style: GoogleFonts.catamaran(
                                          fontSize: 17,
                                          color: Colors.grey.shade200,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Cars", "10000");
                                Get.to(CategoryScreen(
                                  name: "Cars",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Cars",
                                      style: GoogleFonts.catamaran(
                                          fontSize: 17,
                                          color: Colors.grey.shade200,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Food", "10000");
                                Get.to(CategoryScreen(
                                  name: "Food",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Food",
                                      style: GoogleFonts.catamaran(
                                          fontSize: 17,
                                          color: Colors.grey.shade200,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Dark", "10000");
                                Get.to(CategoryScreen(
                                  name: "Dark",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Dark",
                                      style: GoogleFonts.catamaran(
                                          fontSize: 17,
                                          color: Colors.grey.shade200,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Nature", "10000");
                                Get.to(CategoryScreen(
                                  name: "Nature",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Nature",
                                      style: GoogleFonts.catamaran(
                                          fontSize: 17,
                                          color: Colors.grey.shade200,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: kiconcolor.withOpacity(.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await categoryController.searchImages(
                                    "Flowers", "10000");
                                Get.to(CategoryScreen(
                                  name: "Flowers",
                                ));
                              },
                              child: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Flowers",
                                      style: GoogleFonts.catamaran(
                                          fontSize: 17,
                                          color: Colors.grey.shade200,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )),
              FadeInLeft(
                from: 100,
                delay: const Duration(milliseconds: 130),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListTile(
                      onTap: () {
                        Get.to(Favorites2());
                      },
                      shape: const Border(),
                      title: Text(
                        "Favorites",
                        style: GoogleFonts.audiowide(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1),
                      )),
                ),
              ),
              FadeInLeft(
                from: 100,
                delay: const Duration(milliseconds: 230),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListTile(
                      shape: const Border(),
                      title: Text(
                        "Settings",
                        style: GoogleFonts.audiowide(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
