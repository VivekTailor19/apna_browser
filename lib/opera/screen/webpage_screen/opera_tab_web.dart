import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../../provider/opera_provider.dart';

class Opera_HomeTab_View extends StatefulWidget {
  const Opera_HomeTab_View({Key? key}) : super(key: key);

  @override
  State<Opera_HomeTab_View> createState() => _Opera_HomeTab_ViewState();
}

class _Opera_HomeTab_ViewState extends State<Opera_HomeTab_View> {

  OperaProvider? opT;
  OperaProvider? opF;


  InAppWebViewController? webcontroller;
  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        webcontroller!.reload();
      },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    opT = Provider.of<OperaProvider>(context);
    opF = Provider.of<OperaProvider>(context, listen: false);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(

        body: InAppWebView(

          initialUrlRequest:
          URLRequest(url: Uri.parse("${opT!.platformlist[index].link}")),

          onLoadStart: (controller, url) {
            webcontroller = controller;
            pullToRefreshController!.endRefreshing();
          },

          onLoadStop: (controller, url) {
            webcontroller = controller;
            pullToRefreshController!.endRefreshing();
          },

          onLoadError: (controller, url, code, message) {
            webcontroller = controller;
            pullToRefreshController!.endRefreshing();
          },


          pullToRefreshController: pullToRefreshController,


        ),


      ),
    );
  }
}
