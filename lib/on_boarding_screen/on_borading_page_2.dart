import 'package:flutter/material.dart';

import '../global_var.dart';
import 'on_boarding_page_3.dart';

class OnBoradingPage2 extends StatefulWidget {
  const OnBoradingPage2({super.key});

  @override
  State<OnBoradingPage2> createState() => _OnBoradingPage2State();
}

class _OnBoradingPage2State extends State<OnBoradingPage2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container(width: double.infinity,height: double.infinity,child: const Image(fit: BoxFit.cover,image: AssetImage("assets/images/bg2.webp")))),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(height: 80,width:130,child: InkWell(onTap: () {
                nextPageFade(const OnBoardingPage3());
              },child: Image(image: AssetImage("assets/images/btn_next.webp")))),
            ),
          ),

        ],
      ),
    );
  }
}
