import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_guru/utils/cons.dart';
import 'package:loan_guru/wigets/button_custom.dart';
import 'package:loan_guru/wigets/textfiled.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/color.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final List<String> _currencies = [
    'USD', 'EUR', 'GBP', 'JPY', 'AUD', 'CAD', 'CHF', 'CNY', 'SEK', 'NZD',
    'MXN', 'SGD', 'HKD', 'NOK', 'KRW', 'INR'
  ];

  String _fromCurrency = 'USD';
  String _toCurrency = 'INR';
  double _amount = 0.0;
  double _convertedAmount = 0.0;
  bool _isLoading = false;

  final TextEditingController _amountController = TextEditingController();

  Future<void> _convertCurrency() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
        Uri.parse('https://api.exchangerate-api.com/v4/latest/$_fromCurrency'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rate = data['rates'][_toCurrency];
      setState(() {
        _convertedAmount = _amount * rate;
        _isLoading = false;
      });
    } else {
      setState(() {
        _convertedAmount = 0.0;
        _isLoading = false;
      });
      // Handle error here (e.g., show a message to the user)
    }
  }
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
                            "Currency Converter",
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
            Expanded(child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                2.ph,
                DropdownButton<String>(
                  isExpanded: true,
                  value: _fromCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _fromCurrency = newValue!;
                    });
                  },
                  items: _currencies.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                2.ph,
                DropdownButton<String>(
                  isExpanded: true,
                  value: _toCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _toCurrency = newValue!;
                    });
                  },
                  items: _currencies.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                2.ph,
                MyCustomTextField(controller:_amountController,hintText:" Amount",onChanged: (p0) {
                  setState(() {
                    _amount = double.tryParse(p0) ?? 0.0;
                  });
                },),
                SizedBox(height: 20),
                CustomButton(text: "Convert", onPressed:_convertCurrency,),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : Text(
                  'Converted Amount: ${_convertedAmount.toStringAsFixed(2)} $_toCurrency',
                  style: TextStyle(fontSize: 20),
                ),
              ],),
            )),

          ],
        ),
      ),
    );
  }
}
