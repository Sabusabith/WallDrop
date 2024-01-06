import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:wall4k/service/sharedData.dart';

import '../common/colors.dart';

class AuthServices {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    var gname = gUser.displayName;
    var gemail = gUser.email;
    saveObject("gname", gname);
    saveObject("gemail", gemail);
    saveObject("gtoken", gAuth.accessToken);

    return await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
Get.snackbar(
  
          'Success',
          'Google Sign In Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kbgcolor.withOpacity(.9),
          colorText: kiconcolor,
          icon: Icon(Icons.done,color: Colors.green,)
        );

    });
  }

   Future<UserCredential> signInWithApple() async {

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    try{
      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      var gname = userCredential.user!.displayName;
      var gemail = userCredential.user!.email;
      print('userCredential:${userCredential.user!.email}:${appleCredential.email}');
      saveObject("gname", gname);
      saveObject("gemail", gemail);
      saveObject("gtoken", appleCredential.identityToken);

      return userCredential;
    } catch (e) {
      rethrow;
    }

  }
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
