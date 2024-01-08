import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wall4k/model/favoritemodel.dart';
import 'package:wall4k/screens/splash/splash.dart';

import 'controller/api/getphotosController.dart';
import 'firebase_options.dart';
import 'widgets/favorite_adapter.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(  options: DefaultFirebaseOptions.currentPlatform,);
  await Hive.initFlutter();
  Hive.registerAdapter(
      FavoriteItemAdapter()); // Make sure to replace FavoriteItemAdapter with the generated adapter
  await Hive.openBox<FavoriteItem>('favorites');

  runApp(const GetMaterialApp(
    
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
  final GetPhotosController photosController = Get.put(GetPhotosController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
