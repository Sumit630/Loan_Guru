import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/utils/cons.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import '../../../../utils/color.dart';
import '../../crriticism_and_cons_scrren/contrlloer/criticism_cons_conntroller.dart';
import '../../interest_rates_loans_scrren/controller/interest_controller.dart';
import '../contrlloer/check_credit_card_contrlloer.dart';

class CheckCreditCardOnlineIntrodution extends StatefulWidget {
  const CheckCreditCardOnlineIntrodution({super.key});

  @override
  State<CheckCreditCardOnlineIntrodution> createState() => _CheckCreditCardOnlineIntrodutionState();
}

class _CheckCreditCardOnlineIntrodutionState extends State<CheckCreditCardOnlineIntrodution> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
            return Column(
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
                          Expanded(
                            child: ScrollLoopAutoScroll(
                              duration: const Duration(minutes: 4),
                              // delayAfterScrollInput: Duration(seconds: 50),
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                (GlobalVarr.creditCardSeletType.value=="0")?"Buy Credit Score":
                                (GlobalVarr.creditCardSeletType.value=="1")?"Company Report":
                                (GlobalVarr.creditCardSeletType.value=="2")?"Calculate Score":
                                (GlobalVarr.creditCardSeletType.value=="3")?"Dispute Resolution":
                                (GlobalVarr.creditCardSeletType.value=="4")?"Media Center":"Credit Mantri",
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
                    padding: EdgeInsets.all(12.r),
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
                            padding: EdgeInsets.all(10.r),
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
                                    padding: EdgeInsets.all(10.r),
                                    child: Text("${(GlobalVarr.creditCardSeletType.value=="0")?CheckCreditCardContrlloer.buyCreditScoreString:(GlobalVarr.creditCardSeletType.value=="1")?CheckCreditCardContrlloer.companyReportString:(GlobalVarr.creditCardSeletType.value=="2")?CheckCreditCardContrlloer.culculateString:(GlobalVarr.creditCardSeletType.value=="3")?CheckCreditCardContrlloer.disputeResolutionString:(GlobalVarr.creditCardSeletType.value=="4")?CheckCreditCardContrlloer.mediaCenter:CheckCreditCardContrlloer.creditMantri}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize:20.sp,fontFamily: "Regular"),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
