// import 'package:easy_audience_network/ad/banner_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/country_scrren/view/all_types_of_loan_scrren/view/all_types_of_loan_list_page.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/utils/cons.dart';

import '../../../../Ads/AdsConstants/ads_preference.dart';
import '../../../../Ads/BannerAds/banner_ads.dart';
import '../../../../Ads/NativeAds/native_ads.dart';
import '../../../../utils/color.dart';
import '../controller/all_type_of_loan_controller.dart';

class AllTypesOfLoanPage extends StatefulWidget {
  const AllTypesOfLoanPage({super.key});

  @override
  State<AllTypesOfLoanPage> createState() => _AllTypesOfLoanPageState();
}

class _AllTypesOfLoanPageState extends State<AllTypesOfLoanPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: screenHeight / 12.8,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      gradient:
                      LinearGradient(colors: [colorPink, colorRed]),
                    ),
                    alignment: Alignment.center,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(15.r),
                              child: InkWell(onTap: () {
                                Navigator.pop(context);
                              },child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                            ),
                            const Spacer(),
                            Text(
                              "Types  Of Loan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Regular",
                                  color: Colors.white,
                                  fontSize: 24.sp),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: DisplayBannerAds(),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 40.r,vertical:20.r),
                    child: ListView.builder(physics: const BouncingScrollPhysics(),shrinkWrap: true,itemCount: AllTypeOfLoanController.nameOfAllTypeOfLoanList.length+1,itemBuilder: (context, index) {
                      if((index+1)%8==0){
                        return(PreferencesManager.get_Status=="on")?NativeAds():const SizedBox();
                      }
                      int countryIndex = index;
                      if (index > 7) {
                        countryIndex -= 1; // Adjust index for countries after banner
                      }
                      return  Column(
                        children: [
                          InkWell(onTap: () {
                            //print("Var :: ${GlobalVarr.creditCardSeletType}");
                            GlobalVarr.creditCardTypesOfLoan(countryIndex);
                            nextPageFade(const AllTypesOfLoanListPage());
                            print("index:;${countryIndex}");
                          },child: Image(image: AssetImage("assets/images/${AllTypeOfLoanController.nameOfAllTypeOfLoanList[countryIndex]}"))),
                          2.ph,
                        ],
                      );
                    },),
                  ),
                ],
              ),
            )),
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
