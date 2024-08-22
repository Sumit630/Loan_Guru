import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Ads/AdsConstants/ads_preference.dart';
import '../../Ads/BannerAds/banner_ads.dart';
import '../../Ads/IntrestialAds/intrestial_ads.dart';
import '../../Ads/NativeAds/native_ads.dart';
import '../../country_scrren/view/country_home_page.dart';
import '../../global_var.dart';
import '../../utils/color.dart';
import '../controller/credit_card_list_controller.dart';

class ChooseLoanMonthPage extends StatefulWidget {
  const ChooseLoanMonthPage({super.key});

  @override
  State<ChooseLoanMonthPage> createState() => _ChooseLoanMonthPageState();
}

class _ChooseLoanMonthPageState extends State<ChooseLoanMonthPage> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    Container(
                      height: screenHeight / 7.8,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                        gradient:
                        LinearGradient(colors: [colorPink, colorRed]),
                      ),
                      alignment: Alignment.center,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Choose Loan Month",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Regular",
                                color: Colors.white,
                                fontSize: 22.sp),
                          ),
                          Text(
                            "For How Many Days You Need The Loan ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Regular",
                                color: Colors.white,
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
                      child: ListView.builder(physics: BouncingScrollPhysics(),shrinkWrap: true,itemCount:CreditCardTypeController.nameOfCreditCardChooseLoanMonthList.length,itemBuilder: (context, index) {
                        return  InkWell(
                          onTap: () {
                            nextPageFade(const CountryHomePage());
                          },
                          child: Container(
                            width: screenWidth,
                            height: 55,
                            margin: EdgeInsets.symmetric(vertical: 8.r),
                            decoration: const BoxDecoration(
                              gradient:
                              LinearGradient(colors: [colorPink, colorRed]),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  CreditCardTypeController.nameOfCreditCardChooseLoanMonthList[index],
                                  textAlign: TextAlign.start,
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: "Regular",
                                      fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ),
                        );
                      },),
                    ),
                  ],
                ),
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
