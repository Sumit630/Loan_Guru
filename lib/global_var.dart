
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class GlobalVarr {
  static RxString creditCardSeletType="".obs;
}

nextPageFade(Widget page) {
  return Get.to(page, transition: Transition.rightToLeft);
}
nextPageFadeBottomUp(Widget page) {
  return Get.to(page, transition: Transition.downToUp);
}