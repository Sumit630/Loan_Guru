import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_guru/utils/cons.dart';

import '../Ads/AdsConstants/ads_preference.dart';
import '../Ads/BannerAds/banner_ads.dart';
import '../Ads/IntrestialAds/intrestial_ads.dart';
import '../Ads/NativeAds/native_ads.dart';
import '../global_var.dart';
import '../select_credit_list_scrren/view/credit_card_type_home_page.dart';
import '../utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RxInt selectedAge = 18.obs;
  final PageController _controller = PageController(viewportFraction: 1 / 5);
  RxInt selectedGender = 0.obs;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          print(selectedAge);
          return Column(
            children: [
              (PreferencesManager.get_Status=="on")?NativeAds():const SizedBox(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(onTap: () {
                          InterstitialAds.showAds(callBack : (){
                            Navigator.pop(context);
                          });
                        },child: Icon(Icons.arrow_back_ios,color: Colors.red,size: 30,)),
                      ),
                      3.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Select Your Right Information For Grad Opportunity\nTo Get Loan In Easy Way With Us.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontFamily: "Regular"),
                            ),
                          ),
                        ],
                      ),
                      3.ph,
                      Container(
                        height:screenHeight/5,
                        width: screenWidth,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 15.r),
                              child: Row(
                                children: [
                                  Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/ask_question.webp")),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.r),
                              child: Container(
                                height: screenHeight / 15,
                                width: screenWidth / 1.7,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gradient:
                                      LinearGradient(colors: [colorPink, colorRed]),
                                ),
                                alignment: Alignment.center,
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      "How old you are?",
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: "Regular",
                                      ),
                                      speed: const Duration(
                                          milliseconds:
                                              100), // Adjust typing speed here
                                    ),
                                  ],
                                  isRepeatingAnimation: false,
                                  // Set to false to type the text once
                                  repeatForever: false,
                                ),
                                // color: Colors.amberAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      2.ph,
                      Container(
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [colorPink, colorRed]),
                        ),
                        child: Column(
                          children: [
                            2.ph,
                             Text(
                              "Please select your age",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Regular",
                                  fontSize: 20.sp),
                            ),
                            2.ph,
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.black.withOpacity(0.0),
                                        Colors.black.withOpacity(1.0),
                                        Colors.black.withOpacity(1.0),
                                        Colors.black.withOpacity(0.0),
                                      ],
                                      stops: const [0.0, 0.3, 0.7, 1.0],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: SizedBox(
                                    height: 50,
                                    child: PageView.builder(
                                      controller: _controller,
                                      itemCount: 100, // From 18 to 100
                                      onPageChanged: (index) {
                                        setState(() {
                                          selectedAge(18 + index % 83);
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        int age = 18 + index % 83;
                                        return Center(
                                          child: Text(
                                            '$age',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: selectedAge.value == age
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 2,
                              endIndent: 160,
                              indent: 160,
                            ),
                          ],
                        ),
                      ),
                      2.ph,
                       Text(
                        "Select Your Gender",
                        style: TextStyle(
                            fontFamily: "Regular", fontSize: 18.sp, color: Colors.black),
                      ),
                      1.ph,
                      Container(
                        height: screenHeight / 4.5,
                        width: screenWidth,
                        margin: EdgeInsets.all(10.r),
                        //color:colorDimRed ,
                        decoration: const BoxDecoration(
                            color: colorDimRed,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    InterstitialAds.showAds(callBack : (){
                                      selectedGender(0);
                                    });
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: (selectedGender.value==0)?AssetImage(
                                              "assets/images/male_active.webp"):AssetImage(
                                              "assets/images/male_inactive.webp")),
                                    ),
                                    // color: Colors.amberAccent,
                                  ),
                                ),
                                4.pw,
                                InkWell(
                                  onTap: () {
                                    InterstitialAds.showAds(callBack : (){
                                      selectedGender(1);
                                    });

                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: (selectedGender.value==1)?AssetImage(
                                              "assets/images/female_active.webp"):AssetImage(
                                              "assets/images/female_inactive.webp")),
                                    ),
                                    // color: Colors.amberAccent,
                                  ),
                                ),
                              ],
                            ),
                            2.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      color:(selectedGender.value==0)?Colors.red:Colors.black,
                                      fontFamily: "Regular",
                                      fontSize: 18.sp),
                                ),
                                12.pw,
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      color: (selectedGender.value==1)?Colors.red:Colors.black,
                                      fontFamily: "Regular",
                                      fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(20.r),
                          child: SizedBox(
                              height: 80,
                              width: 130,
                              child: InkWell(
                                  onTap: () {
                                        nextPageFade(const CreditCardTypeHomePage());
                                  },
                                  child: const Image(
                                      image:
                                          AssetImage("assets/images/btn_next.webp")))),
                        ),
                      ),
                      1.6.ph,
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: DisplayBannerAds(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
