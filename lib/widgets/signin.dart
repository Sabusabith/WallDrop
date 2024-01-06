//signin With Google
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall4k/controller/login_register_controller.dart';
import 'package:wall4k/screens/splash/splash.dart';
import 'package:wall4k/service/service.dart';

import '../common/colors.dart';
import '../screens/home/home.dart';
import '../service/sharedData.dart';
LoiginRegisterController controller = Get.put(LoiginRegisterController());

signInWithGoogle(bool? isGoogle) async {
  if (isGoogle ?? true) {
    await AuthServices().signInWithGoogle();
  } else {
    await AuthServices().signInWithApple();
  }
  
  var gname = await getSavedObject("gname");
  var gemail = await getSavedObject("gemail");
  var gtoken = await getSavedObject("gtoken");
  print("gid ::${gtoken.toString()}");
  print("gname ::${gname.toString()}");
  controller.loginsucces(true);
}




  firebaseLogin(TextEditingController emailController,TextEditingController passwordController ) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((value) {
      if (value != null) {
      Get.snackbar(
  
          'Success',
          'Login Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kbgcolor.withOpacity(.9),
          colorText: kiconcolor,
          icon: Icon(Icons.done,color: Colors.green,)
        );
          controller.loginsucces(true);
        Get.to(Splash());
      }
    }).onError((error, stackTrace) {
      // network!
      //     ? 
       Get.snackbar(
  
          'Failed',
          'Login Failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kbgcolor.withOpacity(.9),
          colorText: kiconcolor,
          icon: Icon(Icons.close,color: Colors.red,)
        );
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text("Invalid email or password!")));
          // : ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text("No internet connection!")));
    });
  }



  //register 

   firebaseRegister(TextEditingController email,TextEditingController password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim())
        .then((value) {
      if (value != null) {


        saveObject("login", true);
       
        saveObject("email", email.text.trim());
        Get.snackbar(
  
          'Success',
          'Register Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kbgcolor.withOpacity(.9),
          colorText: kiconcolor,
          icon: Icon(Icons.done,color: Colors.green,)
        );
          controller.loginsucces(true);
    Get.to(Splash());
      }
    }).onError((error, stackTrace) {
      // network!
      //     ? ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text("Something wrong try again")))
      //     : ScaffoldMessenger.of(context)
      //         .showSnackBar(SnackBar(content: Text("No internet connection!")));
       Get.snackbar(
  
          'Failed',
          'Register Failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kbgcolor.withOpacity(.9),
          colorText: kiconcolor,
          icon: Icon(Icons.close,color: Colors.red,)
        );
    });
  }