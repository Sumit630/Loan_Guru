
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';



class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final String iconSvgPath;
  final double width;
  final double textSize;
  final Color color;
  final bool circularBorder;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.iconSvgPath = '',
    this.width = double.infinity,
    this.textSize = 16,
    this.color = Colors.white,
    this.circularBorder = true,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient:
          const LinearGradient(colors: [colorPink, colorRed]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          borderRadius: widget.circularBorder
              ? BorderRadius.circular(12)
              : BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
                widget.onPressed();
              setState(() {});
            },
            splashColor:Colors.grey,
            borderRadius: widget.circularBorder
                ? BorderRadius.circular(12)
                : BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient:
                const LinearGradient(colors: [colorPink, colorRed]),
              ),
              height: (widget.width > MediaQuery.of(context).size.width / 2)
                  ? 50
                  : 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.iconSvgPath.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      widget.iconSvgPath,
                      color: widget.color,
                      width: 20,
                      height: 20,
                    ),
                  )
                      : const SizedBox(),
                  Expanded(
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.textSize.sp,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
