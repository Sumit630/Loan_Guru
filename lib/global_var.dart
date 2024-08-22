
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Ads/IntrestialAds/intrestial_ads.dart';
class GlobalVarr {
  static RxString creditCardSeletType="".obs;
  static RxInt creditCardTypesOfLoan=0.obs;
}

nextPageFade(Widget page) {
  return InterstitialAds.showAds(callBack : (){
    Get.to(page,transition: Transition.rightToLeft);
  });

  //return
}
nextPageFadeBottomUp(Widget page) {
  return Get.to(page, duration: Duration(seconds: 2),transition: Transition.downToUp);
}