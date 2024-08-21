import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';

class MyCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLength;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  MyCustomTextField({
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLength = 100,
    this.enabled = true,
    this.validator,
    this.textStyle,
    this.decoration,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  _MyCustomTextFieldState createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: textDimColor,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),

      child: TextFormField(
        onChanged:widget.onChanged,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        obscureText: widget.obscureText,
        cursorColor: Colors.red,
        //maxLength: widget.maxLength,
        enabled: widget.enabled,
        validator: widget.validator,
        style: TextStyle(color:textBleckColor,fontFamily: "Regular",fontSize:20.sp,fontWeight: FontWeight.w400),
        decoration: widget.decoration ??
            InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color:textBleckColor,fontFamily: "Regular",fontSize:22.sp,fontWeight: FontWeight.w400),
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide(color:textDimColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color:textDimColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color:textDimColor),
              ),
            ),
      ),
    );
  }
}