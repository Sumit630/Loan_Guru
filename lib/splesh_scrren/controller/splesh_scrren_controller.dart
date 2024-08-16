import 'dart:async';

import '../../global_var.dart';
import '../../on_boarding_screen/on_boarding_page_1.dart';

class SpleshScrrenConttroler{
  static Timer?timer1;
  static autoTimeNextPage() async {
    timer1=Timer(const Duration(seconds: 5),() {
      print("Time off");
      print("Timer ::${timer1}");
      timer1?.cancel();
      nextPageFadeBottomUp(const OnBoardingPage1());
      // nextPageFade(const OnBoardingPage1());
    },);
  }
}