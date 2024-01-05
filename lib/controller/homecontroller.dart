import 'package:get/get.dart';

class HomeController extends GetxController{

RxBool search = false.obs;

 clickSearch(){
  search.value = !search.value;
 }


}