import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        fontSize: 34.sp),
                  ),
                  Text(
                    "For How Many Days You Need The Loan ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Regular",
                        color: Colors.white,
                        fontSize: 22.sp),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
              child: ListView.builder(shrinkWrap: true,itemCount:CreditCardTypeController.nameOfCreditCardChooseLoanMonthList.length,itemBuilder: (context, index) {
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
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontFamily: "Regular",
                              fontSize: 20.sp),
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
    );
  }
}
