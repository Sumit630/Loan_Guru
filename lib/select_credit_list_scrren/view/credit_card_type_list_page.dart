import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loan_guru/select_credit_list_scrren/view/credit_card_type_list_data_select_page.dart';
import 'package:loan_guru/utils/cons.dart';

import '../../global_var.dart';
import '../../utils/color.dart';
import '../controller/credit_card_list_controller.dart';
import 'credit_card_type_home_page.dart';

class CreditCardTypeListPage extends StatefulWidget {
  const CreditCardTypeListPage({super.key});

  @override
  State<CreditCardTypeListPage> createState() => _CreditCardTypeListPageState();
}

class _CreditCardTypeListPageState extends State<CreditCardTypeListPage> {
  String? _selectedCreditCardType;
  String? _selectedCreditCardTypeSalery;
  String? _selectedCreditCardTypeLoanPayment;
  String? _selectedCreditCardTypeLoanMoth;
  String? _selectedCreditCardTypeProfession;

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
                height: screenHeight / 7.8,
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(colors: [colorPink, colorRed]),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Your Trusted Loan Advisor Calculate, Compare,\nand Manger  Loans  Hassle-free.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Regular",
                      color: Colors.white,
                      fontSize: 20.sp),
                ),
              ),
              Padding(
                padding:
                 EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: (GlobalVarr.creditCardSeletType.value ==
                      "Credit card Score")
                      ? CreditCardTypeController
                      .nameOfCreditCardScoreList.length
                      : (GlobalVarr.creditCardSeletType.value ==
                      "Salary") ? CreditCardTypeController
                      .nameOfCreditCardSalaryList.length :
                  (GlobalVarr.creditCardSeletType.value ==
                      "Loan Payment")?
                  CreditCardTypeController
                      .nameOfCreditCardLoanPaymentList.length:
                  (GlobalVarr.creditCardSeletType.value ==
                      "Loan Month")?
                  CreditCardTypeController
                      .nameOfCreditCardLoanMonthList.length:
                  CreditCardTypeController
                      .nameOfCreditCardProfessionList.length,

                  itemBuilder: (context, index) {
                    String creditCardType = CreditCardTypeController
                        .nameOfCreditCardScoreList[index];
                    String creditCardSalary = CreditCardTypeController
                        .nameOfCreditCardSalaryList[index];
                    String creditCardLoanPayment = CreditCardTypeController
                        .nameOfCreditCardLoanPaymentList[index];
                    String creditCardLoanMonth = CreditCardTypeController
                        .nameOfCreditCardLoanMonthList[index];
                    String creditCardLoanProfession = CreditCardTypeController
                        .nameOfCreditCardProfessionList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (GlobalVarr.creditCardSeletType.value ==
                              "Credit card Score") {
                            _selectedCreditCardType =
                                creditCardType; // Update the selected value when the row is tapped
                            print(
                                "Name :; ${CreditCardTypeController
                                    .nameOfCreditCardScoreList[index]}");
                          } else if(GlobalVarr.creditCardSeletType.value ==
                              "Salary") {
                            _selectedCreditCardTypeSalery = creditCardSalary;
                          } else if(GlobalVarr.creditCardSeletType.value ==
                              "Loan Payment"){
                            _selectedCreditCardTypeLoanPayment = creditCardLoanPayment;
                          } else if(GlobalVarr.creditCardSeletType.value ==
                              "Loan Month"){
                            _selectedCreditCardTypeLoanMoth = creditCardLoanMonth;
                          }
                          else{
                            _selectedCreditCardTypeProfession = creditCardLoanProfession;
                          }
                        });
                      },
                      child: Container(
                        width: screenWidth,
                        height: 55,
                        margin:  EdgeInsets.symmetric(vertical: 8.r),
                        decoration: const BoxDecoration(
                          gradient:
                          LinearGradient(colors: [colorPink, colorRed]),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: (GlobalVarr.creditCardSeletType.value ==
                                  "Credit card Score")
                                  ? CreditCardTypeController
                                  .nameOfCreditCardScoreList[index]
                                  : (GlobalVarr.creditCardSeletType.value ==
                                  "Salary")? CreditCardTypeController
                                  .nameOfCreditCardSalaryList[index]:
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Loan Payment")?
                              CreditCardTypeController
                                  .nameOfCreditCardLoanPaymentList[index]:
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Loan Month")?
                              CreditCardTypeController
                                  .nameOfCreditCardLoanMonthList[index]:
                              CreditCardTypeController
                                  .nameOfCreditCardProfessionList[index],
                              groupValue:
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Credit card Score")
                                  ? _selectedCreditCardType
                                  : (GlobalVarr.creditCardSeletType.value ==
                                  "Salary")?_selectedCreditCardTypeSalery:
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Loan Payment")?
                                  _selectedCreditCardTypeLoanPayment:
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Loan Month")?
                              _selectedCreditCardTypeLoanMoth:
                              _selectedCreditCardTypeProfession,
                              activeColor: Colors.green,
                              // Custom active color
                              fillColor:
                              MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors
                                        .white; // Border color when selected
                                  }
                                  return Colors
                                      .white; // Border color when not selected
                                },
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (GlobalVarr.creditCardSeletType.value ==
                                      "Credit card Score") {
                                    _selectedCreditCardType = value;
                                  } else if(GlobalVarr.creditCardSeletType.value ==
                                      "Salary") {
                                    _selectedCreditCardTypeSalery = value;
                                  }else if(GlobalVarr.creditCardSeletType.value ==
                                      "Loan Payment"){
                                    _selectedCreditCardTypeLoanPayment = value;
                                  }else if(GlobalVarr.creditCardSeletType.value ==
                                      "Loan Month"){
                                    _selectedCreditCardTypeLoanMoth = value;
                                  }
                                  else{
                                    _selectedCreditCardTypeProfession = value;
                                  }
                                  // Update the selected value
                                });
                              },
                            ),
                            2.pw,
                            Text(
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Credit card Score")
                                  ? CreditCardTypeController
                                  .nameOfCreditCardScoreList[index]
                                  :  (GlobalVarr.creditCardSeletType.value ==
                                  "Salary")?CreditCardTypeController
                                  .nameOfCreditCardSalaryList[index]:
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Loan Payment") ?
                              CreditCardTypeController
                                  .nameOfCreditCardLoanPaymentList[index]:
                              (GlobalVarr.creditCardSeletType.value ==
                                  "Loan Month") ?
                              CreditCardTypeController
                                  .nameOfCreditCardLoanMonthList[index]:
                              CreditCardTypeController
                                  .nameOfCreditCardProfessionList[index],
                              textAlign: TextAlign.start,
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Regular",
                                  fontSize: 20.sp),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                            ),
                            1.pw,
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              (_selectedCreditCardType != null||_selectedCreditCardTypeSalery!=null||_selectedCreditCardTypeLoanPayment!=null||_selectedCreditCardTypeLoanMoth!=null||_selectedCreditCardTypeProfession!=null)?Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: SizedBox(
                      height: 80,
                      width: 130,
                      child: InkWell(
                          onTap: () {
                            if(_selectedCreditCardType==""&&_selectedCreditCardTypeSalery==""&&_selectedCreditCardTypeLoanPayment==""&&_selectedCreditCardTypeLoanMoth==""&&_selectedCreditCardTypeProfession==""){
                            }
                            else{
                              nextPageFade(CreditCardTypeListDataSelectPage());
                            }
                           /// nextPageFade(const CreditCardTypeHomePage());
                          },
                          child: const Image(
                              image:
                              AssetImage("assets/images/btn_next.webp")))),
                ),
              ):SizedBox(),
            ],
          );
        }),
      ),
    );
  }
}
