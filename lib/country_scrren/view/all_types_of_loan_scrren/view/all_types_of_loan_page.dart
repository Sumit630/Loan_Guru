import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color.dart';

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
                      Spacer(),
                      Text(
                        "Types  Of Loan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Regular",
                            color: Colors.white,
                            fontSize: 24.sp),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(shrinkWrap: true,itemCount: 10,itemBuilder: (context, index) {
              return SizedBox();
            },),
          ],
        ),
      ),
    );
  }
}
