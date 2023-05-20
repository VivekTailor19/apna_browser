import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import 'opera_provider.dart';

class OperaSearch extends StatefulWidget {
  const OperaSearch({Key? key}) : super(key: key);

  @override
  State<OperaSearch> createState() => _OperaSearchState();
}

class _OperaSearchState extends State<OperaSearch> {

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

    String link = ModalRoute.of(context)!.settings.arguments as String;

    opT = Provider.of<OperaProvider>(context);
    opF = Provider.of<OperaProvider>(context,listen:false);

    return SafeArea(
      child: Scaffold(
        body: InAppWebView(

          initialUrlRequest:
          URLRequest(url: Uri.parse("https://www.google.com/search?q=$link")),

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
