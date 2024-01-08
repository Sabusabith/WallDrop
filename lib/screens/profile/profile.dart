import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/controller/favoritecontroller.dart';
import 'package:wall4k/controller/login_register_controller.dart';
import 'package:wall4k/widgets/signin.dart';

import '../../controller/image_detail_controller.dart';
import '../../service/service.dart';
import '../../service/sharedData.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  LoiginRegisterController controller = Get.put(LoiginRegisterController());
FavoritesController fcontroller = Get.put(FavoritesController());
  final ImageDetailController controllers = Get.put(ImageDetailController());

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: kbgcolor,
        width: size.width,
        height: size.height,
        child: FirebaseAuth.instance.currentUser != null
            ? SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      CupertinoIcons.person_alt_circle,
                      color: kiconcolor.withOpacity(.7),
                      size: 80,
                    ),
                    SizedBox(height: 30,),
                    RichText(maxLines: 2,
                        text: TextSpan(
                            text: "",
                            style: GoogleFonts.dmMono(color: kiconcolor,fontSize: 20,),

                            children: [
                          TextSpan(
                              text: FirebaseAuth.instance.currentUser?.email)
                        ])),
                        SizedBox(height: 10,),
                         Obx(
                    () => Text(
                      'Favorite Images: ${fcontroller.favoriteItems.length}',
                      style: GoogleFonts.dmMono(
                        color: kiconcolor.withOpacity(.7),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                   Obx(
                    () => Text(
                      'Downloaded Images: ${controllers.downloadCount.value}',
                      style: GoogleFonts.dmMono(
                        color: kiconcolor.withOpacity(.7),
                      ),
                    ),
                  ),
                    Spacer()
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await signInWithGoogle(true);
                    },
                    child: Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kiconcolor)),
                      child: Row(
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/images/g.png",
                            height: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Sign In with Google",
                            style: GoogleFonts.audiowide(color: kiconcolor),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: kiconcolor.withOpacity(.4),
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "or",
                          style: GoogleFonts.dmMono(color: kiconcolor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Divider(
                          color: kiconcolor.withOpacity(.4),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Obx(
                    () => controller.isTap.value
                        ? register(size)
                        : Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: SizedBox(
                                  height: 55,
                                  width: size.width,
                                  child: TextField(
                                    controller: emailController,
                                    cursorColor: kiconcolor.withOpacity(.8),
                                    style:
                                        GoogleFonts.dmMono(color: kiconcolor),
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: GoogleFonts.dmMono(
                                          color: kiconcolor.withOpacity(.5),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kiconcolor)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kiconcolor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kiconcolor)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kiconcolor))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: SizedBox(
                                  height: 55,
                                  width: size.width,
                                  child: TextField(
                                    controller: passController,
                                    cursorColor: kiconcolor.withOpacity(.8),
                                    style:
                                        GoogleFonts.dmMono(color: kiconcolor),
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: GoogleFonts.dmMono(
                                          color: kiconcolor.withOpacity(.5),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kiconcolor)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kiconcolor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kiconcolor)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kiconcolor))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: size.width,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black.withOpacity(.9))),
                                    onPressed: () {
                                      firebaseLogin(
                                          emailController, passController);
                                    },
                                    child: Text(
                                      "Login",
                                      style:
                                          GoogleFonts.dmMono(color: kiconcolor),
                                    )),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => controller.isTap.value
                        ? RichText(
                            text: TextSpan(
                                text: "Already have an Account?",
                                style: GoogleFonts.dmMono(
                                    color: kiconcolor.withOpacity(.8)),
                                children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle the tap action, e.g., navigate to the registration screen
                                        controller.isChange();
                                      },
                                    text: " Login",
                                    style: GoogleFonts.dmMono(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))
                              ]))
                        : RichText(
                            text: TextSpan(
                                text: "Don't have an Account?",
                                style: GoogleFonts.dmMono(
                                    color: kiconcolor.withOpacity(.8)),
                                children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle the tap action, e.g., navigate to the registration screen
                                        controller.isChange();
                                      },
                                    text: " Register",
                                    style: GoogleFonts.dmMono(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))
                              ])),
                  )
                ],
              ));
  }

  //Register fields
  Widget register(Size size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            height: 55,
            width: size.width,
            child: TextField(
              controller: emailController,
              cursorColor: kiconcolor.withOpacity(.8),
              style: GoogleFonts.dmMono(color: kiconcolor),
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: GoogleFonts.dmMono(
                    color: kiconcolor.withOpacity(.5),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kiconcolor),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor))),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            height: 55,
            width: size.width,
            child: TextField(
              controller: nameController,
              cursorColor: kiconcolor.withOpacity(.8),
              style: GoogleFonts.dmMono(color: kiconcolor),
              decoration: InputDecoration(
                  hintText: "Full Name",
                  hintStyle: GoogleFonts.dmMono(
                    color: kiconcolor.withOpacity(.5),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kiconcolor),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor))),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            height: 55,
            width: size.width,
            child: TextField(
              controller: passController,
              cursorColor: kiconcolor.withOpacity(.8),
              style: GoogleFonts.dmMono(color: kiconcolor),
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: GoogleFonts.dmMono(
                    color: kiconcolor.withOpacity(.5),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kiconcolor),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kiconcolor))),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: size.width,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.black.withOpacity(.9))),
              onPressed: () {
                firebaseRegister(emailController, passController);
              },
              child: Text(
                "Register",
                style: GoogleFonts.dmMono(color: kiconcolor),
              )),
        )
      ],
    );
  }
}
