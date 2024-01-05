
import 'package:get/get.dart';
import 'package:wall4k/screens/home/home.dart';
class SplasController extends GetxController{
 
 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     Future.delayed(Duration(seconds: 3), () {
      // Navigate to the desired screen after the splash screen
      Get.to(Home()); // Replace HomeScreen with your main screen
    });
  }



}