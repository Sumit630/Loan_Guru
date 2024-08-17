import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan_guru/global_var.dart';

import 'on_borading_page_2.dart';

class OnBoardingPage1 extends StatefulWidget {
  const OnBoardingPage1({super.key});

  @override
  State<OnBoardingPage1> createState() => _OnBoardingPage1State();
}

class _OnBoardingPage1State extends State<OnBoardingPage1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: Stack(
          children: [
            const Column(
              children: [
                Expanded(child: SizedBox(width: double.infinity,height: double.infinity,child: Image(fit: BoxFit.cover,image: AssetImage("assets/images/bg1.webp")))),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(height: 80,width:130,child: InkWell(onTap: () {
                  nextPageFade(const OnBoradingPage2());
                },child: const Image(image: AssetImage("assets/images/btn_next.webp")))),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
