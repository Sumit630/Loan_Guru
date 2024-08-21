import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/utils/cons.dart';

import '../../../../global_var.dart';
import '../../../../utils/color.dart';
import '../contrlloer/check_credit_card_contrlloer.dart';
import 'check_credit_card_online_introdution.dart';

class ChackCreditOnlineHomePage extends StatefulWidget {
  const ChackCreditOnlineHomePage({super.key});

  @override
  State<ChackCreditOnlineHomePage> createState() => _ChackCreditOnlineHomePageState();
}

class _ChackCreditOnlineHomePageState extends State<ChackCreditOnlineHomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                        padding: EdgeInsets.all(15.r),
                        child: InkWell(onTap: () {
                          Navigator.pop(context);
                        },child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                      ),
                      const Spacer(),
                      Text(
                        "Check Credit Online",
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
            2.ph,
            Text("Check Crediit Scrooe Online Tool",style: TextStyle(fontSize: 18.sp,color: Colors.black,fontFamily: "Regular"),),
            Expanded(
              child: Padding(
                padding:EdgeInsets.symmetric(horizontal: 20.r,vertical: 20.r),
                child: ListView.builder(
                  itemCount:CheckCreditCardContrlloer.checkCreditCardList.length,
                  shrinkWrap: true,itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      GlobalVarr.creditCardSeletType("$index");
                      nextPageFade(const CheckCreditCardOnlineIntrodution());
                    },
                    child:Column(
                      children: [
                        Image.asset("assets/images/${CheckCreditCardContrlloer.checkCreditCardList[index]}"),
                        2.ph,
                      ],
                    )
                  );
                },),
              ),
            )],
        ),
      ),
    );
  }
}
