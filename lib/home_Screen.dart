import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.teal,
          title: Text("Browsers",style: TextStyle(color: Colors.white,fontSize: 25)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: () => Navigator.pushNamed(context, "apna"),
                  child: HomeOptions("Apna_Browser")),

              GestureDetector(onTap: () => Navigator.pushNamed(context, "opera"),
                  child: HomeOptions("Opera Mini")),



            ],
          ),
        ),
      ),
    );
  }

  Widget HomeOptions(String optname) {
    return Container(
      height: 60,
      width: 200,
      alignment: Alignment.center,
      child: Text(
        "$optname",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.indigo],
          )),
    );
  }
}
