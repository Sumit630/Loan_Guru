import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/country_scrren/view/crriticism_and_cons_scrren/view/criticism_and_cons_page.dart';
import 'package:loan_guru/country_scrren/view/interest_rates_loans_scrren/view/interest_rates_loans_introdution_page.dart';
import 'package:loan_guru/country_scrren/view/loan_guide_scrren/view/loan_guide_page.dart';
import 'package:loan_guru/country_scrren/view/payday_loan_alternatives_scrren/view/payday_loan_alternatives_page.dart';
import 'package:loan_guru/country_scrren/view/payday_loan_scrren/contrlloer/pay_day_controller.dart';
import 'package:loan_guru/country_scrren/view/payday_loan_scrren/view/pay_day_page.dart';
import 'package:loan_guru/country_scrren/view/pyaday_specirftific_scrren/view/pyaday_specific_page.dart';
import 'package:loan_guru/country_scrren/view/tips_on_getting_loan_scrren/view/tips_on_getting_loan_page.dart';
import 'package:loan_guru/country_scrren/view/variatuion_on_payday_scrren/view/variation_on_payday_page.dart';
import 'package:loan_guru/country_scrren/view/why_payday_scrren/view/why_paydey_page.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/utils/cons.dart';

import '../controller/country_controller.dart';
import 'Repayment_scrren/view/repayment_page.dart';
import 'all_types_of_loan_scrren/view/all_types_of_loan_page.dart';
import 'comparisons_lenders_scrren/view/comparisons_page.dart';
import 'currency_converter_screen/view/currency_converter_page.dart';
import 'finance_tips_scrren/view/finance_page.dart';
import 'insurance_policy_scrren/view/insurance_policy_page.dart';
import 'mutualfund_scrren/view/mutual_fund_page.dart';

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
                      InkWell(onTap: () {
                        nextPageFade(const AllTypesOfLoanPage());
                      },child: const Image(image: AssetImage("assets/images/home_types_loan.webp"))),
                      2.ph,
                      InkWell(
                          onTap: () {
                            nextPageFade(const InterestRatesLoansIntrodutionPage());
                          },
                          child: const Image(image: AssetImage("assets/images/home_interest_rate.webp"))),
                      2.ph,
                      InkWell(
                          onTap: () {
                            nextPageFade(const TipsOnGettingLoanPage());
                          },
                          child: const Image(image: AssetImage("assets/images/home_tips_of_loan.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const LoanGuidePage());
                      },child: const Image(image: AssetImage("assets/images/home_loan_guide.webp"))),
                      // 2.ph,
                      // const Image(image: AssetImage("assets/images/home_multi_tool.webp")),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const RepaymentPage());
                      },child: const Image(image: AssetImage("assets/images/home_repayment.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const CurrencyConverterPage());
                      },child: const Image(image: AssetImage("assets/images/home_cureency_converter.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const MutualFundPage());
                      },child: const Image(image: AssetImage("assets/images/home_mutual_funds.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const InsurancePolicyPage());
                      },child: const Image(image: AssetImage("assets/images/home_insurance_policy.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const FinancePage());
                      },child: const Image(image: AssetImage("assets/images/home_finance_tips.webp"))),
                      2.ph,
                      Text("Other Credit Card Tools",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 24.sp,fontFamily: "Regular"),),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_check_credit_online.webp")),
                      2.ph,
                      const Image(image: AssetImage("assets/images/home_check_credit_offline.webp")),
                      2.ph,
                      Text("Payment LoanTools",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 24.sp,fontFamily: "Regular"),),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const PayDayPage());
                      },child: const Image(image: AssetImage("assets/images/home_payday_process.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const WhyPaydeyPage());
                      },child: const Image(image: AssetImage("assets/images/home_why_payday.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const PyadaySpecificPage());
                      },child: const Image(image: AssetImage("assets/images/home_payday_countries.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const ComparisonsPage());
                      },child: const Image(image: AssetImage("assets/images/home_payday_lenders.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const VariationOnPaydayPage());
                      },child: const Image(image: AssetImage("assets/images/home_comparisons_variation.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const PaydayLoanAlternativesPage());
                      },child: const Image(image: AssetImage("assets/images/home_payday_alternatives.webp"))),
                      2.ph,
                      InkWell(onTap: () {
                        nextPageFade(const CriticismAndConsPage());
                      },child: const Image(image: AssetImage("assets/images/home_payday_criticism.webp"))),
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
