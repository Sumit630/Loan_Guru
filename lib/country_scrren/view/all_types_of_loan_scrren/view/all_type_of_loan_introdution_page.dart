import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/utils/cons.dart';
import 'package:loan_guru/wigets/button_custom.dart';
import 'package:loan_guru/wigets/textfiled.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import '../../../../utils/color.dart';
import '../controller/all_type_of_loan_controller.dart';

class AllTypeOfLoanIntrodutionPage extends StatefulWidget {
  const AllTypeOfLoanIntrodutionPage({super.key});

  @override
  State<AllTypeOfLoanIntrodutionPage> createState() => _AllTypeOfLoanIntrodutionPageState();
}

class _AllTypeOfLoanIntrodutionPageState extends State<AllTypeOfLoanIntrodutionPage> {
  RxInt chengText=0.obs;
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _loanTermController = TextEditingController();
  double _monthlyPayment = 0.0;


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
                            GlobalVarr.creditCardSeletType.value,
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
            (GlobalVarr.creditCardSeletType.value=="What is Mortgage Loans?")?
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
                        child: Text("${AllTypeOfLoanController.nameOfFollowStepsLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
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
                                child: Text("${AllTypeOfLoanController.nameOfApplyFollowStepsLoanIntrodutionString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize:20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply  Mortgage Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                          color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyMortgageString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
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
                                child: Text("${AllTypeOfLoanController.nameOfApplyFMortgageIntrodutionString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your Mortgage Loan!")?Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is Auto Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfAutoLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfWhatAutoLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply Auto Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyAutoLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfApplyAutoIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your Auto Loan!")?Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is Personal Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfPersonalLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfPersonalIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply Personal Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyPersonalLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfApplyPersonalIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your Personal Loan!")?Expanded(
              child:  Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is Student Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfStudentLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfStudentIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply Student Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyStudentLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
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
                                child: Text("${AllTypeOfLoanController.nameOfApplyStudentIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your Student Loan!")?Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is creditcard Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfCreditCardLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfCreditCardIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply creditcard Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyCreditCardLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfApplyCreditCardIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your Credit Card Score!")?Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is business Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfBusinessLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfBusinessIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply business Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyBusinessLoanLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfAppluBusinessIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your business Card Loan!")?Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is Personal Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfPersonalLineOfCreditString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfPersonalLinesIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply Personal Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyPersonalLineOfCreditString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfApplyPersonalLinesIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your Personal Card Loan!?")?Expanded(
              child:  Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is payday Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfPaydayString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfPayDayIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply payday Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyPaydayString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfApplyPayDayIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your payday Card Loan!")?Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is Auto Title Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfAutoTitleString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfAutoTitleIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply Auto Title Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyAutoTitleString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfApplyAutoTitleIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="Calculate your Auto Title Loan!")?Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="What is Home Equity Loan?")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfHomeEquityString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfHomeEquityIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            (GlobalVarr.creditCardSeletType.value=="How to apply Home Equity Loan??")?Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:colorDimRed,
                        border: Border.all(color: textDimColor,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${AllTypeOfLoanController.nameOfApplyHomeEquityString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration:  BoxDecoration(
                          color:colorDimRed,
                          border: Border.all(color: textDimColor,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        alignment: Alignment.center,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${AllTypeOfLoanController.nameOfApplyHomeEquityIntrodutionLoanString}",textAlign: TextAlign.center,style: TextStyle(color: textBleckColor,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Regular"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            Expanded(
              child:  Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //caclulatero
                    MyCustomTextField(controller: _principalController,hintText: "Loan Principal",),
                    2.ph,
                    MyCustomTextField(controller: _interestRateController,hintText: "Annual Interest Rate (%)",),
                    2.ph,
                    MyCustomTextField(controller: _loanTermController,hintText: "Loan Term (Years)",),
                    SizedBox(height: 20),
                    CustomButton(text: "Calculate", onPressed: _calculateMortgage),
                    SizedBox(height: 20),
                    Text(
                      'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Regular",color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _calculateMortgage() {
    double principal = double.tryParse(_principalController.text) ?? 0.0;
    double interestRate = double.tryParse(_interestRateController.text) ?? 0.0;
    int loanTerm = int.tryParse(_loanTermController.text) ?? 0;

    // Convert interest rate to a monthly rate
    double monthlyInterestRate = (interestRate / 100) / 12;
    // Convert loan term to months
    int numberOfPayments = loanTerm * 12;

    // Calculate monthly payment
    double monthlyPayment = (principal * monthlyInterestRate) /
        (1 - pow(1 + monthlyInterestRate, -numberOfPayments));

    setState(() {
      _monthlyPayment = monthlyPayment;
    });
  }
}
