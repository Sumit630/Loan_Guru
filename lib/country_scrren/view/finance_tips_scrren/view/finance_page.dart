import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/utils/cons.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import '../../../../utils/color.dart';
import '../../interest_rates_loans_scrren/controller/interest_controller.dart';
import '../contrlloer/finance_contrlloer.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
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
                        padding: const EdgeInsets.all(15),
                        child: InkWell(onTap: () {
                          Navigator.pop(context);
                        },child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                      ),
                      Expanded(
                        child: ScrollLoopAutoScroll(
                          duration: const Duration(minutes: 4),
                          // delayAfterScrollInput: Duration(seconds: 50),
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "Finance Tips",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Regular",
                                color: Colors.white,
                                fontSize: 24.sp),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${InterestController.interestList}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20.sp,fontFamily: "Regular"),),
                      ),
                    ),
                    2.ph,
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${FinanceContrlloer.financeContrlloerIntrodutionList}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize:20.sp,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
