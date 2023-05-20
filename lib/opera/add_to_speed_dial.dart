import 'package:advanceflutter/opera/opera_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add_To_SpeedDial extends StatefulWidget {
  const Add_To_SpeedDial({Key? key}) : super(key: key);

  @override
  State<Add_To_SpeedDial> createState() => _Add_To_SpeedDialState();
}

class _Add_To_SpeedDialState extends State<Add_To_SpeedDial> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtaddress = TextEditingController();

  OperaProvider? opT;
  OperaProvider? opF;

  @override
  Widget build(BuildContext context) {
    opT = Provider.of<OperaProvider>(context);
    opF = Provider.of<OperaProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 25,
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
          title: Text(
            "Add speed dial",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtname,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.indigo.shade300,
                showCursor: true,
                decoration: InputDecoration(
                  label: Text(
                    "Name",
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.indigo),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.indigo)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.indigo)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtaddress,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.indigo.shade300,
                showCursor: true,
                decoration: InputDecoration(
                  label: Text(
                    "Address",
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.indigo),
                  prefixText: "https://www.",
                  prefixStyle: TextStyle(color: Colors.black,fontSize: 20),

                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.indigo)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.indigo)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 20, color: Colors.indigo),
                      ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      opF!.call_speedDial(
                          name: txtname.text, link: txtaddress.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo),
                  ),
                  SizedBox(width: 10,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
