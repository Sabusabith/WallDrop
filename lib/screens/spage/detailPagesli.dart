import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';

class DetailPagesLi extends StatelessWidget {
  DetailPagesLi({super.key,required this.img});
String img;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(  
        centerTitle:  true ,
        title:
               FadeInDown(
                  from: 100,
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(seconds: 1),
                  child: Text(
                    "WallDrop",
                    style: GoogleFonts.audiowide(color: kiconcolor),
                  ),
                ),
             elevation: 0,
      
 backgroundColor: Colors.transparent,
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Center(
              child: InkWell(
                onTap: () {
                 Get.back();
                },
                child: FadeInLeft(
                  from: 100,
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(seconds: 1),
                  child:Icon(Icons.arrow_back_ios_new_rounded,color: kiconcolor,)
                ),
              ),
            ),
          );
        }),
      ),
      backgroundColor: kbgcolor,
      body: FadeInUp(
        child: Container(
          width: size.width,
          height: size.height,
        
          decoration: BoxDecoration(image:  DecorationImage(image:   AssetImage(img),fit: BoxFit.cover),
          
        ),  child: SafeArea(
          child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(image: DecorationImage(image:NetworkImage("https://media0.giphy.com/media/hVZgpgxk4Dp8vqG4be/giphy.gif?cid=ecf05e47bw71rahudrtbntgid0pitmft9q3guvfbj222fagh&ep=v1_stickers_search&rid=giphy.gif&ct=s"),fit: BoxFit.cover) )),
        )),
      ),
        
      
    );
  }
}
