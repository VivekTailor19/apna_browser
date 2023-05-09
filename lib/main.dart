import 'package:advanceflutter/screen/apnasearch.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => ApnaSearch(),

        },
      ),
    ),
  );
}
