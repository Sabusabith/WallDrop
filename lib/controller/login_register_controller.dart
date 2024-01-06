import 'package:get/get.dart';

class LoiginRegisterController extends GetxController{
RxBool isTap = false.obs;
RxBool loginsucces = false.obs;


isChange(){
  isTap.value = !isTap.value;
}
}