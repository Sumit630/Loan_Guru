import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_guru/country_scrren/view/emi_loan_guide_page.dart';
import 'package:loan_guru/global_var.dart';
import 'package:loan_guru/utils/cons.dart';

import '../../select_credit_list_scrren/controller/credit_card_list_controller.dart';
import '../../utils/color.dart';
import '../../wigets/hexagon_shape.dart';
import '../controller/country_controller.dart';

class CountryHomePage extends StatefulWidget {
  const CountryHomePage({super.key});

  @override
  State<CountryHomePage> createState() => _CountryHomePageState();
}

class _CountryHomePageState extends State<CountryHomePage> {
  String? _selectedCreditCardType;
  RxBool  selectSharsh=false.obs;
  TextEditingController searchOFCountryConttroler=TextEditingController();
  List<String> filteredCountries = List.from(CreditCountryController.nameOfCountryList);
  List<String> allCountries = CreditCountryController.nameOfCountryList;
  void _filterCountries(String query) {

    if (query.isNotEmpty) {
      List<String> filteredList = [];
      for (var country in allCountries) {
        if (country.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(country);
        }
      }
      setState(() {
        filteredCountries = filteredList;
      });
    } else {
      setState(() {
        filteredCountries = allCountries;
        print("filteredCountries :;${filteredCountries}");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: (_selectedCreditCardType != null)?FloatingActionButton(onPressed: () {
      nextPageFade(const EmiLoanGuidePage());
        },backgroundColor: Colors.white,child: const Icon(Icons.keyboard_arrow_right_outlined,color: Colors.black,),):null,
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
                      (selectSharsh.value==false)?Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(onTap: () {
                            Navigator.pop(context);
                          },child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                          Text(
                            "Choose Your Countrty",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Regular",
                                color: Colors.white,
                                fontSize: 20.sp),
                          ),
                          InkWell(onTap: () {
                            selectSharsh(true);
                          },child: const Icon(Icons.search,color: Colors.white,)),
                        ],
                      ):TextField(
                        controller: searchOFCountryConttroler,
                        cursorColor: Colors.red,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontFamily: "Regular",
                        ),
                        onChanged: (value) {
                          _filterCountries(value);
                        },
                        decoration: InputDecoration(
                          icon:  Padding(
                            padding: EdgeInsets.all(10.0.r),
                            child: Icon(Icons.search,color:Colors.white,),
                          ),
                          suffixIcon: InkWell(onTap: () {
                            filteredCountries = allCountries;
                            searchOFCountryConttroler.text="";
                            selectSharsh(false);
                          },child: const Icon(Icons.close,color: Colors.white,)),
                          border: InputBorder.none
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r,vertical: 20.r),
                    child: ListView.builder(itemCount:filteredCountries.length,shrinkWrap: true,itemBuilder: (context, index) {
                      String creditCardType = filteredCountries[index];
                      print("list Count :; ${CreditCountryController.nameOfCountryList[index]}||Image ${CreditCountryController.imageOfCountry[index]}");
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCreditCardType = creditCardType; // Update the selected value when the r
                          });
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
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.all(8.0.r),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration:BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(2, 4),
                                      ),
                                    ],
                                    shape:BoxShape.circle,
                                    gradient:
                                    const LinearGradient(colors: [colorPink, colorRed]),
                            //        image:DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/${CreditCountryController.imageOfCountry[CreditCountryController.nameOfCountryList.indexOf(filteredCountries[index])]}"))
                                  ),
                                  child: ClipPath(
                                    clipBehavior: Clip.hardEdge,
                                      clipper: HexagonClipper(),
                                      child: Image(fit: BoxFit.cover,image: AssetImage("assets/images/${CreditCountryController.imageOfCountry[CreditCountryController.nameOfCountryList.indexOf(filteredCountries[index])]}"))),
                                ),
                              ),
                              Text(
                                filteredCountries[index],
                                textAlign: TextAlign.start,
                                style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: "Regular",
                                    fontSize: 18.sp),
                              ),
                              Radio<String>(
                                value: CreditCountryController.nameOfCountryList[index],
                                groupValue: _selectedCreditCardType,
                                activeColor: Colors.green, // Custom active color
                                fillColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return Colors.white; // Border color when selected
                                    }
                                    return Colors.white; // Border color when not selected
                                  },
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCreditCardType = value;
                                //    GlobalVarr.creditCardSeletType(CreditCardTypeController.nameOfCreditCardTypeHomeList[index]);
                                  //  nextPageFade(CreditCardTypeListPage());// Update the selected value
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                      },),
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
