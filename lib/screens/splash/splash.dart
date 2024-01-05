import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/splashController.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      body: GetBuilder<SplasController>(init: SplasController(),
       builder:(controller) => Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'), fit: BoxFit.cover),
          ),
          child: Align(
              alignment: Alignment(0, .55),
              child: Text(
                "WallDrop",
                style: GoogleFonts.audiowide(
                    color: kiconcolor, fontSize: 35, letterSpacing: 2),
              )),
        ),
      ),
    );
  }
}
