import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';

class ApnaSearch extends StatefulWidget {
  const ApnaSearch({Key? key}) : super(key: key);

  @override
  State<ApnaSearch> createState() => _ApnaSearchState();
}

class _ApnaSearchState extends State<ApnaSearch> {
  TextEditingController txtsearch = TextEditingController();
  InAppWebViewController? webcontroller;

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: InAppWebView(
                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://www.google.com/")),
                onLoadStart: (controller, url) {
                  webcontroller = controller;
                },
                onLoadStop: (controller, url) {
                  webcontroller = controller;

                },
                onLoadError: (controller, url, code, message) {},
                onProgressChanged: (controller, progress) {
                  webcontroller = controller;

                },
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
