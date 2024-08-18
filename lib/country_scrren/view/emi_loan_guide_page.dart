import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/utils/cons.dart';

import '../controller/country_controller.dart';

class EmiLoanGuidePage extends StatefulWidget {
  const EmiLoanGuidePage({super.key});

  @override
  State<EmiLoanGuidePage> createState() => _EmiLoanGuidePageState();
}

class _EmiLoanGuidePageState extends State<EmiLoanGuidePage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Image(image: AssetImage("assets/images/header.webp")),
            2.ph,

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical:20),
                  child: Column(
                    children: [
                      Text("All Financial Tools",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 24.sp,fontFamily: "Regular"),),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_types_loan.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_interest_rate.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_tips_of_loan.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_loan_guide.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_multi_tool.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_repayment.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_cureency_converter.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_mutual_funds.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_insurance_policy.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_finance_tips.webp")),
                      2.ph,
                      Text("Other Credit Card Tools",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 24.sp,fontFamily: "Regular"),),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_check_credit_online.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_check_credit_offline.webp")),
                      2.ph,
                      Text("Payment LoanTools",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 24.sp,fontFamily: "Regular"),),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_payday_process.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_why_payday.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_payday_countries.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_payday_lenders.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_comparisons_variation.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_payday_alternatives.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_payday_criticism.webp")),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
