
import 'package:advanceflutter/opera/add_to_speed_dial.dart';
import 'package:advanceflutter/simple_browser/provider/apnaprovider.dart';
import 'package:advanceflutter/simple_browser/screen/apnasearch.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'home_Screen.dart';
import 'opera/opera_provider.dart';
import 'opera/opera_tab_web.dart';
import 'opera/operafirst.dart';
import 'opera/operasearch.dart';

void main() {
  runApp(
    // DevicePreview(
    //    enabled: !kReleaseMode,
    //    builder: (context) =>
      MultiProvider(
         providers: [
          ChangeNotifierProvider(create: (context) => ApnaProvider(),),
          ChangeNotifierProvider(create: (context) => OperaProvider(),)
        ],
       child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
           debugShowCheckedModeBanner: false,
            routes: {
             "/":(context) => HomeScreen(),
              "apna":(context) => ApnaSearch(),
              "opera":(context) => Opera_First(),
              "operatabs":(context) => Opera_HomeTab_View(),
              "operasearch":(context) => OperaSearch(),
              "speeddial":(context) => Add_To_SpeedDial(),

          },
        ),
      ),
    ),
      // ),
  );
}
