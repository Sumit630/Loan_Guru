import 'package:flutter/material.dart';
import 'package:loan_guru/global_var.dart';

import 'on_borading_page_2.dart';

class OnBoardingPage3 extends StatefulWidget {
  const OnBoardingPage3({super.key});

  @override
  State<OnBoardingPage3> createState() => _OnBoardingPage3State();
}

class _OnBoardingPage3State extends State<OnBoardingPage3> {
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container(width: double.infinity,height: double.infinity,child: const Image(fit: BoxFit.cover,image: AssetImage("assets/images/bg3.webp")))),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(height: 80,width:130,child: InkWell(onTap: () {

              },child: Image(image: AssetImage("assets/images/btn_next.webp")))),
            ),
          ),

        ],
      ),
    );
  }
}
