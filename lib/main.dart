import 'package:advanceflutter/provider/apnaprovider.dart';
import 'package:advanceflutter/screen/apnasearch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApnaProvider(),)
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => ApnaSearch(),

          },
        ),
      ),
    ),
  );
}
