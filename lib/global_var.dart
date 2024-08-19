
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class GlobalVarr {
  static RxString creditCardSeletType="".obs;
  static RxInt creditCardTypesOfLoan=0.obs;
}

nextPageFade(Widget page) {
  return Get.to(page, duration: Duration(seconds: 1),transition: Transition.rightToLeft);
}
nextPageFadeBottomUp(Widget page) {
  return Get.to(page, duration: Duration(seconds: 2),transition: Transition.downToUp);
}