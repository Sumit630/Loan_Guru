import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double? wd;
double? hg;
late Map cities;

double defaultPadding = 8.r;
const double defultBoderRadius = 6;

const double uiRoundness = 6;
double smallWidgetWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.35;
double largeWidgetWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.55;

extension SizedBoxPadding on num {
  SizedBox get ph  => SizedBox(height: defaultPadding * toDouble());
  SizedBox get pw => SizedBox(width: defaultPadding * toDouble());
  double get m8 => defaultPadding * toDouble();
}