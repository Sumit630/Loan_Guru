
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

nextPageFade(Widget page) {
  return Get.to(page, transition: Transition.rightToLeft);
}
nextPageFadeBottomUp(Widget page) {
  return Get.to(page, transition: Transition.downToUp);
}