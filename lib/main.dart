import 'package:advanceflutter/provider/apnaprovider.dart';
import 'package:advanceflutter/screen/apnasearch.dart';
import 'package:advanceflutter/screen/opera/operafirst.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    DevicePreview(
       enabled: !kReleaseMode,
       builder: (context) =>
      MultiProvider(
         providers: [
          ChangeNotifierProvider(create: (context) => ApnaProvider(),)
        ],
       child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
           debugShowCheckedModeBanner: false,
            initialRoute: "opera",
            routes: {
              "/":(context) => ApnaSearch(),
              "opera":(context) => Opera_First(),

          },
        ),
      ),
    ),
      ),
  );
}
