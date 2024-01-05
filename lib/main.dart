import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wall4k/model/favoritemodel.dart';
import 'package:wall4k/screens/splash/splash.dart';

import 'controller/api/getphotosController.dart';
import 'controller/image_detail_controller.dart';
import 'screens/home/home.dart';
import 'widgets/favorite_adapter.dart';

void main(List<String> args)async {
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteItemAdapter()); // Make sure to replace FavoriteItemAdapter with the generated adapter
  await Hive.openBox<FavoriteItem>('favorites');

 
  runApp(GetMaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
      final GetPhotosController photosController = Get.put(GetPhotosController());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Splash();
  }
}