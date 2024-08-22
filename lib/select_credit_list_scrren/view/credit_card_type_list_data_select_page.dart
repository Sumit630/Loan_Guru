import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/utils/cons.dart';

import '../../Ads/AdsConstants/ads_preference.dart';
import '../../Ads/BannerAds/banner_ads.dart';
import '../../Ads/IntrestialAds/intrestial_ads.dart';
import '../../Ads/NativeAds/native_ads.dart';
import '../../utils/color.dart';
import '../controller/credit_card_list_controller.dart';
import 'choose_loan_month_page.dart';

class CreditCardTypeListDataSelectPage extends StatefulWidget {
  const CreditCardTypeListDataSelectPage({super.key});

  @override
  State<CreditCardTypeListDataSelectPage> createState() => _CreditCardTypeListDataSelectPageState();
}

class _CreditCardTypeListDataSelectPageState extends State<CreditCardTypeListDataSelectPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (PreferencesManager.get_Status=="on")?NativeAds():const SizedBox(),
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
                            "Select Loan Payment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Regular",
                                color: Colors.white,
                                fontSize: 22.sp),
                          ),
                          Text(
                            "How Do You Want To Pay Loan Amount",
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
                      child: ListView.builder(physics: BouncingScrollPhysics(),shrinkWrap: true,itemCount:CreditCardTypeController.nameOfCreditCardSelectLoanList.length,itemBuilder: (context, index) {
                        return  InkWell(
                          onTap: () {
                            nextPageFade(const ChooseLoanMonthPage());
                          },
                          child: Container(
                            width: screenWidth,
                            height: 55,
                            margin: EdgeInsets.symmetric(vertical: 8.r),
                            decoration:  BoxDecoration(
                              gradient:
                              LinearGradient(colors: [colorPink, colorRed]),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  CreditCardTypeController.nameOfCreditCardSelectLoanList[index],
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
