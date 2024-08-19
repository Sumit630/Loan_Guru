import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/country_scrren/view/all_types_of_loan_scrren/view/all_types_of_loan_list_page.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/utils/cons.dart';

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical:20),
                child: ListView.builder(shrinkWrap: true,itemCount: AllTypeOfLoanController.nameOfAllTypeOfLoanList.length,itemBuilder: (context, index) {
                  return  Column(
                    children: [
                      InkWell(onTap: () {
                        //print("Var :: ${GlobalVarr.creditCardSeletType}");
                        GlobalVarr.creditCardTypesOfLoan(index);
                        nextPageFade(const AllTypesOfLoanListPage());
                        print("index:;${index}");
                      },child: Image(image: AssetImage("assets/images/${AllTypeOfLoanController.nameOfAllTypeOfLoanList[index]}"))),
                      2.ph,
                    ],
                  );
                },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
