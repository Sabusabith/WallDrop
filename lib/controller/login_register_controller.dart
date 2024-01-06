import 'package:get/get.dart';

class LoiginRegisterController extends GetxController{
RxBool isTap = false.obs;

isChange(){
  isTap.value = !isTap.value;
}
}