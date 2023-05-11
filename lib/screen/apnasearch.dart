import 'package:advanceflutter/provider/apnaprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ApnaSearch extends StatefulWidget {
  const ApnaSearch({Key? key}) : super(key: key);

  @override
  State<ApnaSearch> createState() => _ApnaSearchState();
}

class _ApnaSearchState extends State<ApnaSearch> {

  ApnaProvider? apT;
  ApnaProvider? apF;

  TextEditingController txtsearch = TextEditingController();
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

    apT = Provider.of<ApnaProvider>(context);
    apF = Provider.of<ApnaProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: txtsearch,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Here....",
                      hintStyle: TextStyle(color: Colors.black54),
                      prefixIcon: Icon(Icons.search_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          webcontroller!.loadUrl(
                            urlRequest: URLRequest(
                              url: Uri.parse(
                                  "https://www.google.com/search?q=${txtsearch.text}"),
                            ),
                          );

                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            LinearProgressIndicator(
              value: apT!.p1,
              backgroundColor: Colors.lightBlue.shade50,

            ),
            Expanded(
              child: InAppWebView(

                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://www.google.com/")),

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

                onProgressChanged: (controller, progress) {
                  webcontroller = controller;
                  pullToRefreshController!.endRefreshing();

                  apF!.changeprogress((progress/100).toDouble());

                },

                pullToRefreshController: pullToRefreshController,


              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => webcontroller!.goBack(),
                  icon: Icon(Icons.arrow_back_rounded),
                  iconSize: 25,
                  color: Colors.black87,
                ),
                IconButton(
                  onPressed: () => webcontroller!.reload(),
                  icon: Icon(Icons.refresh_rounded),
                  iconSize: 25,
                  color: Colors.black87,
                ),
                IconButton(
                  onPressed: () => webcontroller!.goForward(),
                  icon: Icon(Icons.arrow_forward_rounded),
                  iconSize: 25,
                  color: Colors.black87,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
