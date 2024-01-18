
import 'package:get/get.dart';
import 'package:wall4k/screens/home/home.dart';

import '../service/network_status/networkStatus.dart';
class SplasController extends GetxController{
 
 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkConnection();
  }

  checkConnection() async {
    bool network = await internetCheck();

    if (network) {
       Future.delayed(Duration(seconds: 3), () {
        Get.to(  Home());
    
      
    });
    
    } else {
       
       Future.delayed(Duration(seconds: 3), () {
        Get.to(NoConnection());
      
    });
    
  

    }
  }

}