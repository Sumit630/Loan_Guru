import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/global_var.dart';

import '../Ads/BannerAds/banner_ads.dart';
import '../Ads/IntrestialAds/intrestial_ads.dart';
import '../home_scrren/home_page.dart';

class OnBoardingPage3 extends StatefulWidget {
  const OnBoardingPage3({super.key});

  @override
  State<OnBoardingPage3> createState() => _OnBoardingPage3State();
}

class _OnBoardingPage3State extends State<OnBoardingPage3> {
  @override

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: () {
                InterstitialAds.showAds(callBack : (){
                  Navigator.pop(context);
                });
              },child: Icon(Icons.arrow_back_ios,color: Colors.red,size: 30,)),
            ),
            Expanded(
              child: Stack(
                children: [

                  Column(
                    children: [
                      Expanded(child: Container(width: double.infinity,height: double.infinity,child: const Image(fit: BoxFit.cover,image: AssetImage("assets/images/bg3.webp")))),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(20.r),
                      child: SizedBox(height: 80,width:130,child: InkWell(onTap: () {
                        nextPageFade(const HomePage());
                      },child: const Image(image: AssetImage("assets/images/btn_next.webp")))),
                    ),
                  ),
      
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: DisplayBannerAds(),
            ),
          ],
        ),
      ),
    );
  }
}
