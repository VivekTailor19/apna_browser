

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Opera_First extends StatefulWidget {
  const Opera_First({Key? key}) : super(key: key);

  @override
  State<Opera_First> createState() => _Opera_FirstState();
}

class _Opera_FirstState extends State<Opera_First> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 IconButton(icon: Icon(Icons.loop), onPressed: () {}),
                ],
              ),

              TextField(

                style: TextStyle(fontSize: 15,color: Colors.black54),
                decoration: InputDecoration(
                    prefixIcon: Container(margin:EdgeInsets.only(left: 15,right: 8),
                        child: Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                          height: 35,width: 35,)),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mic_rounded,size: 25,color: Colors.black45,),
                          IconButton(icon: Icon(Icons.search_rounded),iconSize: 25,color: Colors.blue,onPressed: (){},),
                        ],
                      ),
                    ),
                  hintText: "Search here...",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),)
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget HomeTabs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: NetworkImage(""))),
                ),
        SizedBox(height: 8),
        Text("",style: TextStyle(fontSize: 13),)
      ],
    );
  }
}
