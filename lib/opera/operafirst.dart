import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'opera_provider.dart';

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

                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(icon: Icon(Icons.tune_rounded,color: Colors.white),
                      onPressed: () {
                         Navigator.pushNamed(context, "speeddial");
                        },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
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
                        crossAxisCount: 5),
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
                
                Container(height: 300,width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 15),

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(Icons.article_rounded,size: 45,color: Colors.indigo,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("Get personalised news",style: TextStyle(fontSize: 25),),
                      ),
                      SizedBox(height:8),

                      Text("Select one or more interests to customise your newsfeed.",style: TextStyle(fontSize: 20),maxLines: 2,textAlign: TextAlign.center,),
                      SizedBox(height:15),
                      ElevatedButton(onPressed: (){},
                          child: Text("Customise news",style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                      ),
                      TextButton(onPressed: () {}, child: Text("Dismiss",style: TextStyle(color: Colors.indigo),))
                      
                    ],
                  )
                )
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
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: NetworkImage("$image"),fit: BoxFit.fill)),
        ),
        SizedBox(height: 8),
        Text(
          "$name",
          style: TextStyle(fontSize: 10,overflow: TextOverflow.ellipsis,color: Colors.white),
        )
      ],
    );
  }
}
