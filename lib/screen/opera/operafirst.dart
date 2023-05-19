import 'package:advanceflutter/screen/opera/opera_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Opera_First extends StatefulWidget {
  const Opera_First({Key? key}) : super(key: key);

  @override
  State<Opera_First> createState() => _Opera_FirstState();
}

class _Opera_FirstState extends State<Opera_First> {
  OperaProvider? opT;
  OperaProvider? opF;

  @override
  Widget build(BuildContext context) {

    TextEditingController txtsearch = TextEditingController();

    opT = Provider.of<OperaProvider>(context);
    opF = Provider.of<OperaProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.indigo.shade100,
            image: DecorationImage(
                image: AssetImage("assets/images/operabg.jpg"),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(icon: Icon(Icons.loop), onPressed: () {}),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    controller: txtsearch,
                    style: TextStyle(fontSize: 15, color: Colors.black54),

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),


                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                            margin: EdgeInsets.only(left: 15, right: 8),
                            child: Image.network(
                              "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                              height: 35,
                              width: 35,
                            )),
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.mic_rounded,
                                size: 25,
                                color: Colors.black45,
                              ),
                              IconButton(
                                icon: Icon(Icons.search_rounded),
                                iconSize: 25,
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.pushNamed(context, "operasearch",arguments: txtsearch.text);
                                },
                              ),
                            ],
                          ),
                        ),
                        hintText: "Search here...",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: Colors.white,width: 1)),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: Colors.white,width: 1)),
                    )

                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: opT!.platformlist.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context , "operatabs",arguments: index);
                      },
                      child: HomeTabs(
                        name: "${opT!.platformlist[index].name}",
                        image: "${opT!.platformlist[index].logo}",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget HomeTabs({String? image, String? name}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: NetworkImage("$image"),fit: BoxFit.fill)),
        ),
        SizedBox(height: 8),
        Text(
          "$name",
          style: TextStyle(fontSize: 13,overflow: TextOverflow.ellipsis,color: Colors.white),
        )
      ],
    );
  }
}
