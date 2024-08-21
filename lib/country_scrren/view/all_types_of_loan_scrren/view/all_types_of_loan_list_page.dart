import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/utils/color.dart';
import 'package:loan_guru/utils/cons.dart';

import '../../../../global_var.dart';
import '../controller/all_type_of_loan_controller.dart';
import 'all_type_of_loan_introdution_page.dart';

class AllTypesOfLoanListPage extends StatefulWidget {
  const AllTypesOfLoanListPage({super.key});

  @override
  State<AllTypesOfLoanListPage> createState() => _AllTypesOfLoanListPageState();
}

class _AllTypesOfLoanListPageState extends State<AllTypesOfLoanListPage> {
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
                        (GlobalVarr.creditCardTypesOfLoan.value==0)?"Mortgage Of Loans":
                        (GlobalVarr.creditCardTypesOfLoan.value==1)?"Auto Loan":
                        (GlobalVarr.creditCardTypesOfLoan.value==2)?"Personal Loan":
                        (GlobalVarr.creditCardTypesOfLoan.value==3)?"Student Loan":
                        (GlobalVarr.creditCardTypesOfLoan.value==4)?"Credit Card":
                        (GlobalVarr.creditCardTypesOfLoan.value==5)?"Business Loan":
                        (GlobalVarr.creditCardTypesOfLoan.value==6)?"Personal Lines  of Credit":
                        (GlobalVarr.creditCardTypesOfLoan.value==7)?"Payday Loan":
                        (GlobalVarr.creditCardTypesOfLoan.value==8)?"Auto Title Loan":
                        "Home Equity Loon",
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
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: ListView.builder(
              itemCount:(GlobalVarr.creditCardTypesOfLoan.value==0)?AllTypeOfLoanController.nameOfMortgageOfLoansList.length:
              (GlobalVarr.creditCardTypesOfLoan.value==1)?AllTypeOfLoanController.nameOfAutoLoanList.length:
             (GlobalVarr.creditCardTypesOfLoan.value==2)?AllTypeOfLoanController.nameOfPersonalLoanList.length:
              (GlobalVarr.creditCardTypesOfLoan.value==3)?AllTypeOfLoanController.nameOfStudentLoanList.length:
              (GlobalVarr.creditCardTypesOfLoan.value==4)?AllTypeOfLoanController.nameOfCreditCardLoanList.length:
              (GlobalVarr.creditCardTypesOfLoan.value==5)?AllTypeOfLoanController.nameOfBusinessLoanList.length:
              (GlobalVarr.creditCardTypesOfLoan.value==6)?AllTypeOfLoanController.nameOfPersonalLinesOfCreditLoanList.length:
              (GlobalVarr.creditCardTypesOfLoan.value==7)?AllTypeOfLoanController.nameOfPaydayLoanList.length:
              (GlobalVarr.creditCardTypesOfLoan.value==8)?AllTypeOfLoanController.nameOfAutoTitleLoanList.length:
              AllTypeOfLoanController.nameOfHomeEquityLoanList.length,
              shrinkWrap: true,itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  GlobalVarr.creditCardSeletType("");
                  if(GlobalVarr.creditCardTypesOfLoan.value==0){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfMortgageOfLoansList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==1){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfAutoLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==2){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfPersonalLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==3){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfStudentLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==4){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfCreditCardLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==5){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfBusinessLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==6){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfPersonalLinesOfCreditLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==7){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfPaydayLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else if(GlobalVarr.creditCardTypesOfLoan.value==8){
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfAutoTitleLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                  else{
                    GlobalVarr.creditCardSeletType(AllTypeOfLoanController.nameOfHomeEquityLoanList[index]);
                    print(GlobalVarr.creditCardSeletType.value);
                    nextPageFade(const AllTypeOfLoanIntrodutionPage());
                  }
                },
                child: Container(
                  width: screenWidth,
                  height: 55,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    gradient:
                    LinearGradient(colors: [colorPink, colorRed]),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      2.pw,
                      Text("${index+1}.",style:  TextStyle(  fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: "Regular",
                          fontSize: 20.sp),),
                      2.pw,
                      Text(
                        (GlobalVarr.creditCardTypesOfLoan.value==0)?AllTypeOfLoanController.nameOfMortgageOfLoansList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==1)?AllTypeOfLoanController.nameOfAutoLoanList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==2)?AllTypeOfLoanController.nameOfPersonalLoanList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==3)?AllTypeOfLoanController.nameOfStudentLoanList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==4)?AllTypeOfLoanController.nameOfCreditCardLoanList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==5)?AllTypeOfLoanController.nameOfBusinessLoanList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==6)?AllTypeOfLoanController.nameOfPersonalLinesOfCreditLoanList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==7)?AllTypeOfLoanController.nameOfPaydayLoanList[index]:
                        (GlobalVarr.creditCardTypesOfLoan.value==8)?AllTypeOfLoanController.nameOfAutoTitleLoanList[index]:
                        AllTypeOfLoanController.nameOfHomeEquityLoanList[index],
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
        )],
        ),
      ),
    );
  }
}
