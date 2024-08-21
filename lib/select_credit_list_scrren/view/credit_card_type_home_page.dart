import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/select_credit_list_scrren/view/credit_card_type_list_page.dart';
import 'package:loan_guru/utils/cons.dart';

import '../../utils/color.dart';
import '../controller/credit_card_list_controller.dart';

class CreditCardTypeHomePage extends StatefulWidget {
  const CreditCardTypeHomePage({super.key});

  @override
  State<CreditCardTypeHomePage> createState() => _CreditCardTypeHomePageState();
}

class _CreditCardTypeHomePageState extends State<CreditCardTypeHomePage> {
  String? _selectedCreditCardType;
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
              height: screenHeight/6.8,
              width: screenWidth,
              decoration: BoxDecoration(
                gradient:  LinearGradient(colors: [colorPink, colorRed]),
              ),
              alignment: Alignment.center,
              child: Text("Please   Select   your   Credit   Score,\nSalary,   Loan Payment,  Loan  Month &\nProfession",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Regular",color: Colors.white,fontSize: 22.sp),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: ListView.separated(shrinkWrap: true,itemBuilder: (context, index) {
                // ignore: prefer_const_constructors
                String creditCardType = CreditCardTypeController.nameOfCreditCardTypeHomeList[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCreditCardType = creditCardType; // Update the selected value when the row is tapped
                      print("Name :; ${CreditCardTypeController.nameOfCreditCardTypeHomeList[index]}");
                      GlobalVarr.creditCardSeletType(CreditCardTypeController.nameOfCreditCardTypeHomeList[index]);
                      nextPageFade(CreditCardTypeListPage());
                    });
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(CreditCardTypeController.nameOfCreditCardTypeHomeList[index],textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "Regular",fontSize: 20.sp),),
                      Radio<String>(
                        value: CreditCardTypeController.nameOfCreditCardTypeHomeList[index],
                        groupValue: _selectedCreditCardType,
                        activeColor: Colors.green, // Custom active color
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return colorRed; // Border color when selected
                            }
                            return colorRed; // Border color when not selected
                          },
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedCreditCardType = value;
                            GlobalVarr.creditCardSeletType(CreditCardTypeController.nameOfCreditCardTypeHomeList[index]);
                            nextPageFade(CreditCardTypeListPage());// Update the selected value
                          });
                        },
                      ),
                    ],
                  ),
                );
              },separatorBuilder:(context, index) {
                return const Divider(color:dividerColor,thickness: 1.2,);
              },itemCount:CreditCardTypeController.nameOfCreditCardTypeHomeList.length),
            ),
          ],
        ),
      ),
    );
  }
}
